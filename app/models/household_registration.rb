# frozen_string_literal: true

class HouseholdRegistration < ApplicationRecord
  require 'esus/models/cadastro_domiciliar/cadastro_domiciliar_thrift'
  require 'esus/models/dado_transporte/dado_transporte_thirft'
  require 'esus/models/common_types'

  belongs_to :doctor

  has_many :families, inverse_of: :household_registration, dependent: :destroy
  accepts_nested_attributes_for :families, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
  has_one_attached :thrift_file

  before_create :serialize_thrift

  def serialize_thrift
    uuid_random = Digest::UUID.uuid_v4

    self.uuid = uuid_random
    self.uuidFichaOriginadora = uuid_random
    self.tpCdsOrigem = 3

    manager_thrift = CadastroDomiciliarGerenciarThrift.new(self)
    serialized_record = manager_thrift.serialize

    manager_dado_transporte = DadoTransporteGerenciarThrift.new(doctor, serialized_record)
    serialized_file = manager_dado_transporte.serialize

    thrift_file.attach(io: serialized_file, filename: "#{uuid}.thrift")
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
