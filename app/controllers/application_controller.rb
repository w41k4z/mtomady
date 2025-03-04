class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Overriding default redirection path after successful authentication
  def after_sign_in_path_for(resource)
    admin_category_translations_path
  end
end
