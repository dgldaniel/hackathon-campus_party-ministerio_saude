class ProcedureSheet < ApplicationRecord
  has_many :care_procedures, inverse_of: :procedure_sheet, dependent: :destroy
  accepts_nested_attributes_for :care_procedures, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  private
  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'procedure_sheets/show.xml.erb',
      :locals => { :@procedure_sheet => self }
    )

    self.xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{self.uuidFicha}.xml"
                          )
  end
end
