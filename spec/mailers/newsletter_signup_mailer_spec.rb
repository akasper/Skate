require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe NewsletterSignupMailer do
  describe :welcome_email do
    it 'responds to #welcome_email' do
      NewsletterSignupMailer.should be_respond_to :welcome_email
    end
    
    it 'requires a user' do
      lambda {NewsletterSignupMailer.welcome_email(nil)}.should raise_error
    end
    
  end
end
