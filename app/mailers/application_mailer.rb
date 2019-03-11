class ApplicationMailer < ActionMailer::Base
  default from: 'learnifyingesoft@gmail.com'
  layout 'mailer'
    
  def sample_email(user, base_url)  
    @user = user
    @recovery_url = "http://#{base_url}/ChangePassword/#{@user.email}/#{@user.reset_password_token}"
    mail(to: @user.email, subject: 'Solicitud de cambio de contraseña')
  end  
end
