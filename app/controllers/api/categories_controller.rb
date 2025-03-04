class Api::CategoriesController < ApplicationController
  def index
    lang = params[:lang]&.split('-')&.first || "en"
    @categories = CategoryView.where("lang ILIKE ?", "#{lang}%")
    render json: @categories
  end
end
