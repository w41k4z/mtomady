class Api::CategoriesController < ApplicationController
  def index
    lang = params[:lang] || "en"
    @categories = CategoryView.where(lang: lang)
    render json: @categories
  end
end
