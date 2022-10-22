# frozen_string_literal: true
class IndividualRegistration < ApplicationRecord
  require 'esus/models/cadastro_individual/cadastro_individual_thrift'
  require 'esus/models/dado_transporte/dado_transporte_thirft'
  require 'esus/models/common_types'

  belongs_to :doctor

  has_one_attached :xml_file
  has_one_attached :thrift_file

  validates :codigoIbgeMunicipioNascimento, presence: true, if: proc { |a| a.nacionalidadeCidadao == 1 }
  validates :dataNascimentoCidadao, presence: true, if: :data_nascimento_cidadao_validates?
  validates :nomeMaeCidadao, presence: true, if: proc { |a| a.desconheceNomeMae == false }
  validates :cnsResponsavelFamiliar, numericality: true
  validates :telefoneCelular, numericality: true
  validates :numeroNisPisPasep, numericality: true
  validates :paisNascimento, presence: true, if: proc { |a| a.nacionalidadeCidadao != 1 }
  validates :cpfCidadao, uniqueness: true, numericality: true
  validates :cnsCidadao, uniqueness: true, numericality: true

  validates :descricaoCausaInternacaoEm12Meses, presence: true, if: proc { |a| a.statusTeveInternadoEm12Meses }
  validates :doencaCardiaca,  presence: true,  if: proc { |a| a.statusTeveDoencaCardiaca }
  validates :doencaRespiratoria,  presence: true,  if: proc { |a| a.statusTemDoencaRespiratoria }
  validates :doencaRins,  presence: true,  if: proc { |a| a.statusTemTeveDoencasRins }
  validates :maternidadeDeReferencia,  presence: true,  if: proc { |a| a.statusEhGestante }
  validates :statusEhGestante, presence: true, if: :status_eh_gestante_validates?

  validates :grauParentescoFamiliarFrequentado, presence: true, if: proc { |a| a.statusSituacaoRua && a.statusVisitaFamiliarFrequentemente == false }
  validates :higienePessoalSituacaoRua, presence: true, if: proc { |a| a.statusSituacaoRua && a.statusTemAcessoHigienePessoalSituacaoRua == true }
  validates :origemAlimentoSituacaoRua, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :outraInstituicaoQueAcompanha, presence: true, if: proc { |a| a.statusSituacaoRua && a.statusAcompanhadoPorOutraInstituicao == false }
  validates :quantidadeAlimentacoesAoDiaSituacaoRua, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :statusAcompanhadoPorOutraInstituicao, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :statusPossuiReferenciaFamiliar, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :statusRecebeBeneficio, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :statusTemAcessoHigienePessoalSituacaoRua, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :statusVisitaFamiliarFrequentemente, presence: true, if: proc { |a| a.statusSituacaoRua }
  validates :tempoSituacaoRua, presence: true, if: proc { |a| a.statusSituacaoRua }

  validates :deficienciasCidadao, presence: true, if: proc { |a| a.statusTemAlgumaDeficiencia == true }
  validates :orientacaoSexualCidadao, presence: true, if: proc { |a| a.statusDesejaInformarOrientacaoSexual == true }
  validates :povoComunidadeTradicional, presence: true, if: proc { |a| a.statusMembroPovoComunidadeTradicional == true }

  # before_create :serialize_data
  before_update :serialize_thrift

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def serialize_thrift
    uuid_random = Digest::UUID.uuid_v4

    self.uuid = uuid_random
    self.uuidFichaOriginadora = uuid_random
    self.tpCdsOrigem = 3

    manager_thrift = CadastroIndividualGerenciarThrift.new(self)
    serialized_record = manager_thrift.serialize

    manager_dado_transporte = DadoTransporteGerenciarThrift.new(doctor, serialized_record, 2)
    serialized_file = manager_dado_transporte.serialize

    SerializeEsusJob.perform_now(self, serialized_file, uuid_random)
  end

  def serialize_data
    self.uuid = Digest::UUID.uuid_v4
    self.uuidFichaOriginadora = Digest::UUID.uuid_v4
    self.tpCdsOrigem = 3

    generate_xml = ActionController::Base.new.render_to_string(
      'individual_registrations/show.xml.erb',
      :locals => { :@individual_registration => self }
    )

    xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{id}.xml"
    )

    SerializeEsusJob.perform_now(self)
  end

  def self.build_options
    {
      municipios: JSON.parse(Rails.cache.read('@CI_Municipio')),
      nacionalidade: JSON.parse(Rails.cache.read('@CI_Nacionalidade')),
      pais: JSON.parse(Rails.cache.read('@CI_Pais')),
      raca_cor: JSON.parse(Rails.cache.read('@CI_Raca_Cor')),
      sexo: JSON.parse(Rails.cache.read('@CI_Sexo')),
      doenca_cardiaca: JSON.parse(Rails.cache.read('@CI_Doenca_Cardiaca')),
      doenca_respiratoria: JSON.parse(Rails.cache.read('@CI_Doenca_Respiratoria')),
      problema_rins: JSON.parse(Rails.cache.read('@CI_Problema_Rins')),
      situacao_peso: JSON.parse(Rails.cache.read('@CI_Situacao_Peso')),
      acesso_higiene: JSON.parse(Rails.cache.read('@CI_Acesso_Higiene')),
      origem_alimento: JSON.parse(Rails.cache.read('@CI_Origem_Alimento')),
      quantas_vezes_alimentacao: JSON.parse(Rails.cache.read('@CI_Quantas_Vezes_Alimentacao')),
      tempo_situacao_rua: JSON.parse(Rails.cache.read('@CI_Tempo_Situacao_Rua')),
      deficiencia_cidadao: JSON.parse(Rails.cache.read('@CI_Deficiencia_Cidadao')),
      curso_mais_elevado: JSON.parse(Rails.cache.read('@CI_Curso_Mais_Elevado')),
      motivo_saida: JSON.parse(Rails.cache.read('@CI_Motivo_Saida')),
      cbo: JSON.parse(Rails.cache.read('@CI_CBO')),
      orientacao_sexual: JSON.parse(Rails.cache.read('@CI_Orientacao_Sexual')),
      relacao_parentesco: JSON.parse(Rails.cache.read('@CI_Relacao_Parentesco')),
      responsavel_crianca: JSON.parse(Rails.cache.read('@CI_Responsavel_Crianca')),
      situacao_mercado_trabalho: JSON.parse(Rails.cache.read('@CI_Situacao_Mercado')),
      etnia: JSON.parse(Rails.cache.read('@CI_Etnia')),
    }
  end

  def status_eh_gestante_validates?
    return false if dataNascimentoCidadao.nil? || dataAtendimento.nil?

    age = (dataNascimentoCidadao.strftime('%Y%m%d').to_i - dataAtendimento.strftime('%Y%m%d').to_i) / 10000

    sexoCidadao == 1 && age > 12
  end

  def data_nascimento_cidadao_validates?
    return false if dataNascimentoCidadao.nil? || dataAtendimento.nil?

    age = (dataNascimentoCidadao.strftime('%Y%m%d').to_i - dataAtendimento.strftime('%Y%m%d').to_i) / 10000

    dataAtendimento < dataNascimentoCidadao && age > 130
  end

end
