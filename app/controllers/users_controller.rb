class UsersController < ApplicationController
  skip_before_filter :require_login
  
  decorates_assigned :user
  
  respond_to :html

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new()
    @user.email=params[:user][:email]
    @user.password=params[:user][:password]
    if @user.save
      if params[:user][:remember_me]
        cookies.permanent[:auth_token] =  @user.auth_token
      else
        cookies[:auth_token] =  @user.auth_token
      end
      redirect_to user_steps_path
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id]).decorate
  end
end