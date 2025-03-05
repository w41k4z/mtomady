# Require authentication for all controllers that inherit from this one
class AdminController < ApplicationController
  before_action :authenticate_admin!

  layout "admin"
end
