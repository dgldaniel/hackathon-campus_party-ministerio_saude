# frozen_string_literal: true
class IndividualRegistration < ApplicationRecord
  require 'esus/models/cadastro_individual/cadastro_individual_thrift'
  require 'esus/models/dado_transporte/dado_transporte_thirft'
  require 'esus/models/common_types'

  belongs_to :doctor

  paginates_per 10

  has_one_attached :xml_file
  has_one_attached :thrift_file

  # before_validation :yet_another_method, on: :save

  # validates_presence_of :dataNascimentoCidadao, if: :data_nascimento_cidadao_validates?
  # validates_presence_of :nomeMaeCidadao, if: proc { |field| field.desconheceNomeMae == false }
  # validates_presence_of :nomePaiCidadao, if: proc { |field| field.desconheceNomePai == false }
  # validates_presence_of :telefoneCelular
  # validates_presence_of :paisNascimento, if: proc { |field| field.nacionalidadeCidadao != 2 }
  # validates_presence_of :dtNaturalizacao, if: proc { |field| field.nacionalidadeCidadao == 2 }
  # validates_presence_of :portariaNaturalizacao, if: proc { |field| field.nacionalidadeCidadao == 2 }
  # validates_presence_of :codigoIbgeMunicipioNascimento, if: proc { |field| field.nacionalidadeCidadao == 1 }
  # validates_presence_of :cpfCidadao
  # validates_presence_of :cnsCidadao

  # validates_presence_of :descricaoCausaInternacaoEm12Meses, if: proc { |field| field.statusTeveInternadoEm12Meses == true }
  # validates_presence_of :doencaCardiaca,  if: proc { |field| field.statusTeveDoencaCardiaca == true }
  # validates_presence_of :doencaRespiratoria,  if: proc { |field| field.statusTemDoencaRespiratoria == true }
  # validates_presence_of :doencaRins,  if: proc { |field| field.statusTemTeveDoencasRins == true }
  # validates_presence_of :maternidadeDeReferencia,  if: proc { |field| field.statusEhGestante == true }
  # validates_presence_of :statusEhGestante, if: :status_eh_gestante_validates?
  # validates_presence_of :descricaoPlantasMedicinaisUsadas,  if: proc { |field| field.statusUsaPlantasMedicinais == true }

  # validates_presence_of :grauParentescoFamiliarFrequentado, if: proc { |field| field.statusSituacaoRua && field.statusVisitaFamiliarFrequentemente == false }
  # validates_presence_of :higienePessoalSituacaoRua, if: proc { |field| field.statusSituacaoRua && field.statusTemAcessoHigienePessoalSituacaoRua == true }
  # validates_presence_of :origemAlimentoSituacaoRua, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :outraInstituicaoQueAcompanha, if: proc { |field| field.statusSituacaoRua && field.statusAcompanhadoPorOutraInstituicao == false }
  # validates_presence_of :quantidadeAlimentacoesAoDiaSituacaoRua, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :statusAcompanhadoPorOutraInstituicao, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :statusPossuiReferenciaFamiliar, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :statusRecebeBeneficio, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :statusTemAcessoHigienePessoalSituacaoRua, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :statusVisitaFamiliarFrequentemente, if: proc { |field| field.statusSituacaoRua }
  # validates_presence_of :tempoSituacaoRua, if: proc { |field| field.statusSituacaoRua }

  # validates_presence_of :deficienciasCidadao, if: proc { |field| field.statusTemAlgumaDeficiencia == true }
  # validates_presence_of :orientacaoSexualCidadao, if: proc { |field| field.statusDesejaInformarOrientacaoSexual == true }
  # validates_presence_of :povoComunidadeTradicional, if: proc { |field| field.statusMembroPovoComunidadeTradicional == true }

  # before_create :serialize_thrift
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

    age = (dataNascimentoCidadao.to_time.to_i - dataAtendimento.to_time.to_i) / 10000

    sexoCidadao == 1 && age > 12
  end

  def data_nascimento_cidadao_validates?
    return false if dataNascimentoCidadao.nil? || dataAtendimento.nil?

    age = (dataNascimentoCidadao.to_time.to_i - dataAtendimento.to_time.to_i) / 10000

    dataAtendimento < dataNascimentoCidadao && age > 130
  end

end
