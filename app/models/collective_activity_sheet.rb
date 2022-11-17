# frozen_string_literal: true
class CollectiveActivitySheet < ApplicationRecord
  require 'esus/models/ficha_atividade_coletiva/ficha_atividade_coletiva_thrift'
  require 'esus/models/dado_transporte/dado_transporte_thirft'
  require 'esus/models/common_types'

  belongs_to :doctor

  has_many :participants, inverse_of: :collective_activity_sheet, dependent: :destroy
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  has_many :professionals, inverse_of: :collective_activity_sheet, dependent: :destroy
  accepts_nested_attributes_for :professionals, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
  has_one_attached :thrift_file

  paginates_per 10

  # validates_presence_of :dtAtividadeColetiva,
  #                       :responsavelCns,
  #                       :responsavelCnesUnidade,
  #                       :atividadeTipo,
  #                       :codigoIbgeMunicipio

  # validates_presence_of :praticasTemasParaSaude, if: :praticas_temas_reuniao_validates
  # validates_presence_of :publicoAlvo, if: :publico_alvo_validates

  before_create :serialize_thrift
  before_update :serialize_thrift

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def serialize_thrift
    uuid_random = Digest::UUID.uuid_v4

    self.uuidFicha = uuid_random
    self.tbCdsOrigem = 6

    manager_thrift = FichaAtividadeColetivaGerenciarThrift.new(self)
    serialized_record = manager_thrift.serialize

    manager_dado_transporte = DadoTransporteGerenciarThrift.new(doctor, serialized_record, 6)
    serialized_file = manager_dado_transporte.serialize

    SerializeEsusJob.perform_now(self, serialized_file, uuid_random)
  end

  def self.build_options
    {
      municipios: JSON.parse(Rails.cache.read('@CI_Municipio')),
      cbo: JSON.parse(Rails.cache.read('@CI_CBO')),
      praticas_tema_saude: JSON.parse(Rails.cache.read('@FAC_Pratica_Tema_Saude')),
      publico_alvo: JSON.parse(Rails.cache.read('@FAC_Publico_Alvo')),
      temas_reuniao: JSON.parse(Rails.cache.read('@FAC_Temas_Reuniao')),
      tipo_atividade_coletiva: JSON.parse(Rails.cache.read('@FAC_Tipo_Atividade_Coletiva')),
    }
  end

  def publico_alvo_validates
    atividadeTipo == 4 || atividadeTipo == 5 || atividadeTipo == 6 || atividadeTipo == 7
  end

  def praticas_temas_reuniao_validates
    atividadeTipo == 4 || atividadeTipo == 5 || atividadeTipo == 6 || atividadeTipo == 7
  end

  private

  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'collective_activity_sheets/show.xml.erb',
      :locals => { :@collective_activity_sheet => self }
    )

    xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{uuidFicha}.xml"
    )
  end
end
