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
  
  context :create do
    it 'is an action' do
      controller.should be_respond_to(:create)
    end
    
    context 'receives valid user data' do
      before :each do
        @user_data = {'email' => 'foo@example.com'}
        post :create, 'user' => @user_data
      end
      
      it 'creates a user object' do
        User.all.count.should == 1
      end
      it 'redirects to the "show user" page'
    end
    
    context 'receives invalid user data' do
      it 'redirects to the "new user" page'
      ['an invalid email adddress', 'no email address'].each do |error|
        describe "such as #{error}" do
          it 'provides meaningful feedback'
        end
      end
    end
  end
  
end
