class UsersController < ApplicationController
  def new
    @user ||= User.new
    render :template => 'users/new'
  end
  
  def create
    user_params = params[:user] || {}
    @user = User.create(:email => user_params[:email])

    if @user.errors.blank?
      redirect_to user_path @user
    else
      flash[:error] = @user.errors.values.join(" ")
      redirect_to new_user_path
    end
  end
  
  def show
  end
  
end
