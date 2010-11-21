class UsersController < ApplicationController
  def new
    @user = User.new
    render :template => 'users/new'
  end
  
  def create
    @user = User.create(params[:user] )
  end
end
