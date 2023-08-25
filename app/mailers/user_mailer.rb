class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bem-vindo ao nosso aplicativo!')
  end

  def email_to_worker(email)
    mail(to: email, subject: 'Assunto do E-mail')
  end
end
