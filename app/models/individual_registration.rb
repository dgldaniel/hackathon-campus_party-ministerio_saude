class IndividualRegistration < ApplicationRecord
  has_one_attached :xml_file

  before_create :generate_xml
  before_update :generate_xml

  scope :generate_xml_from, -> (start_date, end_date) { where("created_at >= ? AND created_at <= ?", start_date, end_date )}

  private
  def generate_xml
    generate_xml = ActionController::Base.new.render_to_string(
      'individual_registrations/show.xml.erb',
      :locals => { :@individual_registration => self }
    )

    self.xml_file.attach(io: StringIO.new(generate_xml),
                           filename: "#{self.id}.xml"
                          )
  end
end
