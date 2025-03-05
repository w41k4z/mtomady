class Admin::CategoryTranslationsController < AdminController
  
  def index
    @categories = Category.all
  end
  
  def new
    @categories = Category.select(:id, :name)
    @languages = SupportedLanguage.all
  end

  # Adding new category translation
  def create
    category = Category.find_by(id: params[:category_id])
    if category.present?
      translation = category.category_translations.build(
        supported_language_id: params[:supported_language_id],
        translation: params[:translation]
      )

      if translation.save
        redirect_to admin_category_translations_path, notice: "Translation created successfully!"
      else
        flash[:error] = "Failed to create translation. Please check the fields and try again."
        render :new
      end
    else
      flash[:error] = "Category not found. Please select a valid category."
      render :new
    end
  end
  
end
