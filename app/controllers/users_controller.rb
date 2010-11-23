#Manages users. For now, users have only an email address.
class UsersController < ApplicationController
  def new
    @user ||= User.new(:email => 'foo@bar.com')
  end
  
  def create
    user_params = params[:user] || {}
    @user = User.new(:email => user_params[:email])

    if @user.save
      NewsletterSignupMailer.welcome_email(@user).deliver
      redirect_to @user
    else
      flash[:error] = @user.errors.values.join("\n")
      redirect_to :action => :new
    end
  end
  
  def show
  end
  
end
