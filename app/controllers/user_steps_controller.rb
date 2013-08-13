class UserStepsController < ApplicationController
  skip_before_filter :require_login
  include Wicked::Wizard
  steps :personal, :social
  
  def show
    @user = current_user
    render_wizard
  end
  
  def update
    @user = current_user
    @user.attributes = params[:user]
    render_wizard @user
  end
  
  private
  def redirect_to_finish_wizard(options = nil)
    redirect_to root_path , notice: "Thank you for signing up."
  end
  
end
