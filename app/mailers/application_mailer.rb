class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
    
  def sample_email(user, base_url)  
    @user = user
    @recovery_url = "#{base_url}/passwords/reset/#{@user.reset_password_token}"
    mail(to: @user.email, subject: 'Solicitud de cambio de contraseña')
  end  
end
