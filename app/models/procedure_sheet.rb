class ProcedureSheet < ApplicationRecord
  has_many :care_procedures, inverse_of: :procedure_sheet, dependent: :destroy
  accepts_nested_attributes_for :care_procedures, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file

  # after_create_commit :append_xml

  private
  def append_xml
    GenerateXmlProcedureSheetJob.perform_now self
  end
end
