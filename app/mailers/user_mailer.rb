class UserMailer < ApplicationMailer
    default from: 'learnifyIngesoft@gmail.com'

    def welcome_email
        @user = params[:user]
        @url = 'http://localhost:3000/users'
        mail(to: @user.email, subject: "Welcome to my awesome site")
    end
end
