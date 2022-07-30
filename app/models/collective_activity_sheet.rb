class CollectiveActivitySheet < ApplicationRecord
  has_many :participants, inverse_of: :collective_activity_sheet, dependent: :destroy
  accepts_nested_attributes_for :participants, reject_if: :all_blank, allow_destroy: true

  has_many :professionals, inverse_of: :collective_activity_sheet, dependent: :destroy
  accepts_nested_attributes_for :professionals, reject_if: :all_blank, allow_destroy: true

  has_one_attached :xml_file

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  private
  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'collective_activity_sheets/show.xml.erb',
      :locals => { :@collective_activity_sheet => self }
    )

    self.xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{self.uuidFicha}.xml"
                          )
  end
end
