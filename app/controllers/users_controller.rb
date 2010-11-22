class UsersController < ApplicationController
  def new
    @user ||= User.new
  end
  
  def create
    user_params = params[:user] || {}
    @user = User.new(:email => user_params[:email])

    if @user.save
      redirect_to @user
    else
      flash[:error] = @user.errors.values.join("\n")
      redirect_to :action => :new
    end
  end
  
  def show
  end
  
end
