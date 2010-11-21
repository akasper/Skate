require 'spec_helper'

describe User do
  it 'has an email' do
    User.new.should be_respond_to(:email)
  end
  
  it 'has a valid email' do
    @user = User.new(:email => 'bademailaddress')
    @user.save.should == false
  end
end
