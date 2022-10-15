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

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def serialize_thrift
    uuid_random = Digest::UUID.uuid_v4

    self.uuidFicha = uuid_random

    manager_thrift = FichaAtividadeColetivaGerenciarThrift.new(self)
    serialized_record = manager_thrift.serialize

    manager_dado_transporte = DadoTransporteGerenciarThrift.new(doctor, serialized_record)
    serialized_file = manager_dado_transporte.serialize

    thrift_file.attach(io: serialized_file, filename: "#{uuidFicha}.thrift")
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
