require 'spec_helper'

describe User do
  it 'has an email' do
    User.new.should be_respond_to(:email)
  end
end
