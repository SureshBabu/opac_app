class SignupMailer < ActionMailer::Base
  default :from => "mc@strataretail.co"

  def registration_confirmation(signup)
    @url = 'http://www.justbooksclc.com'
    @signup = signup
    mail(:to => signup.email, :subject => "Welcome To JustBooks")    
  end

end
