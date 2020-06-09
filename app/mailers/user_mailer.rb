class UserMailer < ApplicationMailer
  default from: 'notification@lyonsvet.com'

  def welcome_email
    @user = params[:user]
    @generated_password = params[:generated_password]
    @url = 'https://lyonsvetclinic.com/sign_in'

    mail(to: @user.email, subject: 'Welcome To Lyons Vet Clinic')
  end
end
