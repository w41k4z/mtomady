class ApplicationController < ActionController::Base
  include Pundit::Authorization

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  rescue_from Pundit::NotAuthorizedError, with: :handle_unauthorized_error
  
  private
  def handle_unauthorized_error
    flash[:error] = 'You are not authorized to perform this action.'
    redirect_to root_path
  end
end
