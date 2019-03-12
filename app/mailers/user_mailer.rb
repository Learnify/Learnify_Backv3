class UserMailer < ApplicationMailer
    default from: 'Equipo de Soporte de Learnify'

    def welcome_email(user)
        @user = user
        @url = 'http://localhost:3000/users'
        mail(to: @user.email, subject: "Welcome to my awesome site")
    end
end
