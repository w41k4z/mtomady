class AdminController < ApplicationController
  before_action :authenticate_user!
    
  private
  def authenticate_user!
    unless current_user&.admin?
      flash[:error] = 'Admin privilege required'
      redirect_to root_path
    end
  end
end