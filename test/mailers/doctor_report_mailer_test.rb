require "test_helper"

class DoctorReportMailerTest < ActionMailer::TestCase
  test "procedure_sheet_zip" do
    mail = DoctorReportMailer.procedure_sheet_zip
    assert_equal "Procedure sheet zip", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
