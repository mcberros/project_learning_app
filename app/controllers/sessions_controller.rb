class SessionsController < ApplicationController
  
  skip_before_filter :require_login, :only => [:new, :create]

  def new
  end

  def create
    user = User.authenticate(params[:log_in][:email], params[:log_in][:password])
    
    if user
      if params[:log_in][:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => 'Logged in!'
    else
      flash.now.alert = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => 'Logged out!'
  end

end
