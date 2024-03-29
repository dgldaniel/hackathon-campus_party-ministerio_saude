# frozen_string_literal: true

class HouseholdRegistration < ApplicationRecord
  require 'esus/models/cadastro_domiciliar/cadastro_domiciliar_thrift'
  require 'esus/models/dado_transporte/dado_transporte_thirft'
  require 'esus/models/common_types'

  belongs_to :doctor

  paginates_per 10

  has_many :families, inverse_of: :household_registration, dependent: :destroy
  accepts_nested_attributes_for :families, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
  has_one_attached :thrift_file

  # validates_presence_of :quantosAnimaisNoDomicilio, if: proc { |field| field.statusTermoRecusaCadatroDomiciliarAtencaoBasica == false && field.stAnimaisNoDomicilio == true }
  # validates_presence_of :animaisNoDomicilio,
  #                       :stAnimaisNoDomicilio,
  #                       :bairro,
  #                       :cep,
  #                       :codigoIbgeMunicipio,
  #                       :complemento,
  #                       :nomeLogradouro,
  #                       :numero,
  #                       :numeroDneUf,
  #                       :telReferencial,
  #                       :telResidencial,
  #                       :tipoLogradouroNumeroDne,
  #                       :stSemNumero,
  #                       :abastecimentoAgua,
  #                       :areaProducaoRural,
  #                       :localizacao,
  #                       :materialPredominanteParedesExtDomicilio,
  #                       :nuComodos,
  #                       :nuMoradores,
  #                       :situacaoMoradiaPosseTerra,
  #                       :stDiponibilidadeEnergiaeletrica,
  #                       :tipoAcessoDomicilio,
  #                       :tipoDomicilio,
  #                       :tratamentoAguaDomicilio,
  #                       if: proc { |field| field.statusTermoRecusaCadatroDomiciliarAtencaoBasica == false }

  # before_create :serialize_thrift

  def serialize_thrift
    uuid_random = Digest::UUID.uuid_v4

    self.uuid = uuid_random
    self.uuidFichaOriginadora = uuid_random
    self.tpCdsOrigem = 3

    manager_thrift = CadastroDomiciliarGerenciarThrift.new(self)
    serialized_record = manager_thrift.serialize

    manager_dado_transporte = DadoTransporteGerenciarThrift.new(doctor, serialized_record, 3)
    serialized_file = manager_dado_transporte.serialize

    SerializeEsusJob.perform_now(self, serialized_file, uuid_random)
  end

  def self.build_options
    {
      municipios: JSON.parse(Rails.cache.read('@CI_Municipio')),
      abastecimento_agua: JSON.parse(Rails.cache.read('@CD_Abastecimento_Agua')),
      acesso_domicilio: JSON.parse(Rails.cache.read('@CD_Acesso_Domicilio')),
      animal_domicilio: JSON.parse(Rails.cache.read('@CD_Animal_Domicilio')),
      destino_lixo: JSON.parse(Rails.cache.read('@CD_Destino_Lixo')),
      escoamento_banheiro: JSON.parse(Rails.cache.read('@CD_Escoamento_Banheiro')),
      estados: JSON.parse(Rails.cache.read('@CD_Estados')),
      localizacao_moradia: JSON.parse(Rails.cache.read('@CD_Localizacao_Moradia')),
      material_predominante_construcao: JSON.parse(Rails.cache.read('@CD_Material_Predominante_Construcao')),
      posse_uso_terra: JSON.parse(Rails.cache.read('@CD_Posse_Uso_Terra')),
      renda_familiar: JSON.parse(Rails.cache.read('@CD_Renda_Familiar')),
      situacao_moradia: JSON.parse(Rails.cache.read('@CD_Situacao_Moradia')),
      tipo_domicilio: JSON.parse(Rails.cache.read('@CD_Tipo_Domicilio')),
      tipo_logradouro: JSON.parse(Rails.cache.read('@CD_Tipo_Logradouro')),
      tratamento_agua_domicilio: JSON.parse(Rails.cache.read('@CD_Tratamento_Agua_Domicilio')),
    }
  end

end
