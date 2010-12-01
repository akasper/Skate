require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe User do
  it 'has an email' do
    User.new.should be_respond_to(:email)
  end
  
  it 'has a valid email' do
    @user = User.new(:email => 'bademailaddress')
    @user.save.should == false
  end
  
  it 'has an opt_out property' do
    User.new.should be_respond_to(:opt_out)
    # foo.bar?
    # foo.should be_bar #means bar returns true
    # foo.should_not be_bar #means bar returns false
  end
end
