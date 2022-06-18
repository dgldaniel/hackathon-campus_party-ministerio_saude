class NotifyUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify_user_mailer.notify.subject
  #
  def notify(patient, message_data)
    @nome_completo = patient.nome_completo
    @description = message_data['description']

    mail to: patient.email, subject: message_data['title']
  end
end
