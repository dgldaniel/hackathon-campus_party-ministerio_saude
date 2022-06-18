class NotifyPatientJob < ApplicationJob
  queue_as :emails

  def perform(notify_patient_data)
    current_patient = IndividualRegistration.find notify_patient_data['id']
    account_sid = Rails.application.credentials[:twillo][:account_id]
    auth_token = Rails.application.credentials[:twillo][:auth_token]
    main_phone_number = Rails.application.credentials[:twillo][:my_phone_number]

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: main_phone_number,
      to: "+55#{current_patient.telefone_celular}",
      body: notify_patient_data['description']
    )

    NotifyUserMailer.notify(current_patient, notify_patient_data).deliver_now
  end
end
