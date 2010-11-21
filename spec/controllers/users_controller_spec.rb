require 'spec_helper'

describe UsersController do
  context :new do
    it 'is an action' do
      controller.should be_respond_to(:new)
    end
    
    it 'generates an empty email form' do
      User.stub!(:new)
      User.should_receive(:new)
      get 'new'
    end
    
    it 'should render the new template' do
      get 'new'
      response.should render_template('users/new')
    end
  end
  
end
