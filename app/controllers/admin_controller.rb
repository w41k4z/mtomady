class AdminController < ApplicationController
  # Require authentication for all controllers that inherit from this one
  before_action :authenticate_admin!

  layout "admin"
end
