class GenerateXmlProcedureSheetJob < ApplicationJob
  require 'zip'

  queue_as :default

  def perform(procudures_selected, current_user)
    current_doctor = current_user.doctor
    zip_file_name = Tempfile.new('procudures_sheets_xml_files.zip')

    Zip::File.open(zip_file_name.path, Zip::File::CREATE) do |zipfile|
      procudures_selected.each do |each_procedure_sheet|
        overlay = Tempfile.new(['overlay', '.xml'])

        overlay.binmode
        overlay.write(each_procedure_sheet.xml_file.download)
        overlay.close
        overlay.path

        zipfile.add("#{each_procedure_sheet.id}.xml", File.join(overlay.path))

      end
    end

    invoices_zip = File.read(zip_file_name.path)
    current_doctor.procedure_sheet_xml_files.attach(io: StringIO.new(invoices_zip),
                                                    filename: 'procedure_xml.zip')

    current_doctor.save!

    DoctorReportMailer.procedure_sheet_zip(current_user.email, current_doctor).deliver_now
  ensure
    zip_file_name.close
    zip_file_name.unlink
  end
end
