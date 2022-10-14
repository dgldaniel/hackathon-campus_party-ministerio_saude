# frozen_string_literal: true
class ProcedureSheet < ApplicationRecord
  belongs_to :doctor

  has_many :care_procedures, inverse_of: :procedure_sheet, dependent: :destroy
  accepts_nested_attributes_for :care_procedures, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file
  has_one_attached :thrift_file

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date)}

  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'procedure_sheets/show.xml.erb',
      :locals => { :@procedure_sheet => self }
    )

    xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{uuidFicha}.xml"
    )
  end

  def self.build_options
    {
      local_atendimento: JSON.parse(Rails.cache.read('@FAI_Local_Atendimento')),
      turno: JSON.parse(Rails.cache.read('@FAI_Turno')),
      sexo: JSON.parse(Rails.cache.read('@CI_Sexo')),
      lista_procedimentos: JSON.parse(Rails.cache.read('@FP_Lista_Procedimentos')),
    }
  end
end
