require 'spec_helper'

def invalid_email_expectations params={}
  before :each do
    post 'create', :user => params
  end
  
  it 'redirects to the "new user" page' do
    response.should redirect_to new_user_path
  end
  it 'provides meaningful feedback' do
    flash[:error].should_not be_blank
  end
end

describe UsersController do
  SAMPLE_USER_DATA = {:email => 'foo@example.com'} unless defined? SAMPLE_USER_DATA

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
      response.should render_template 'users/new'
    end
  end
  
  context :show do
    it 'is an action' do
      controller.should be_respond_to(:show)
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
      it 'redirects to the "show user" page' do
        response.should redirect_to (user_path User.first)
      end
    end
    
    context 'receives invalid user data' do
      
      describe 'such as no "user" field in the params hash' do
        it 'redirects to the new user page' do
          post :create, {}
          response.should redirect_to new_user_path
        end
      end
      
      describe 'such as an invalid email address' do
        invalid_email_expectations :email => 'bademailaddress'
      end
      describe 'such as no email address' do
        invalid_email_expectations :email => ''
        invalid_email_expectations :email => nil
      end
      describe 'such as the submitted email address already existing' do
        before :each do
          post :create, :user => SAMPLE_USER_DATA
          User.all.count.should == 1
        end
        invalid_email_expectations SAMPLE_USER_DATA
      end
    end
  end  
end

