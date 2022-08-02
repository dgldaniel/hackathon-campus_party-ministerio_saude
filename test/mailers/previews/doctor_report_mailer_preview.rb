# Preview all emails at http://localhost:3000/rails/mailers/doctor_report_mailer
class DoctorReportMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/doctor_report_mailer/procedure_sheet_zip
  def procedure_sheet_zip
    DoctorReportMailer.procedure_sheet_zip
  end

end
