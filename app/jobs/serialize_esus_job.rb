# frozen_string_literal: true
class SerializeEsusJob < ApplicationJob
  require 'zip'

  queue_as :default

  def perform(record_data, serialized_file, record_uuid)
    zip_file_name = Tempfile.new("#{record_uuid}.zip")

    Zip::File.open(zip_file_name.path, Zip::File::CREATE) do |zipfile|
      overlay = Tempfile.new(['overlay', '.thrift'])

      overlay.binmode
      overlay.write(serialized_file)
      overlay.close
      overlay.path

      zipfile.add("#{record_uuid}.thrift", File.join(overlay.path))
    end

    invoices_zip = File.read(zip_file_name.path)

    record_data.thrift_file.attach(io: StringIO.new(invoices_zip), filename: "#{record_uuid}.zip")
  end
end
