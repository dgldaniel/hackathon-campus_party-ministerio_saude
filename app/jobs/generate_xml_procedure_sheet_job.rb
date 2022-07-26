class GenerateXmlProcedureSheetJob < ApplicationJob
  require 'open-uri'

  queue_as :default

  def perform(procedure_sheet)
    url = "#{ENV['ROOT_URL']}/procedure_sheets/#{procedure_sheet.id}.xml"

    xml = Nokogiri::HTML(URI.open(url))
  end
end
