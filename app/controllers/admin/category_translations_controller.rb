class Admin::CategoryTranslationsController < AdminController
  
  def index
    @categories = Category.all
  end
  
  def new
  end
  
end
