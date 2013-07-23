class PasswordResetsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset
    redirect_to :root, :notice => "Email sent with password reset instructions."
  end
end
