class UsersController < ApplicationController
  def new
    @user = User.new
    render :template => 'users/new'
  end
end
