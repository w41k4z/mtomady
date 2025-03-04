class Api::CategoriesController < ApplicationController
  def index
    lang = params[:lang]&.split('-')&.first || "en"
    
    # Fetch all categories, using CategoryView to simplify handling translations.
    # The CategoryView is a database view that combines the category and category_translation tables.
    # By using a view, we avoid complex joins — instead, we union both tables and set a default 
    # language value for categories without translations, making the query more efficient.
    @categories = CategoryView.where("lang ILIKE ?", "#{lang}%")
    render json: @categories
  end
end
