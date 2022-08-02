class DoctorReportMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.doctor_report_mailer.procedure_sheet_zip.subject
  #
  def procedure_sheet_zip(email, doctor)
    @link_zip = rails_blob_url(doctor.procedure_sheet_xml_files)

    mail to: email, subject: 'Arquivos XML da Ficha de Procedimentos'
  end
end
