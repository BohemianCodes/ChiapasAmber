class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'bohemiancodes@gmail.com',
         subject: "A new contact form message from #{name}")
  end

  # You have 2 options here
  # 1- pass the user
  # 2- pass the email and the name
  # I'll show you both
  def welcome(email)
    @url =  new_user_session_url
    mail(from: 'bohemiancodes@gmail.com',
    to: email,
    subject: "Welcome to Colors of Chiapas!")
  end
end
