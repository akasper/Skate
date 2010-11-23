class NewsletterSignupMailer < ActionMailer::Base
  default :from => "skate"
  
  def welcome_email(user)
    mail(:to => user.email, :subject => 'Welcome to the Skate newsletter!')
  end
end
