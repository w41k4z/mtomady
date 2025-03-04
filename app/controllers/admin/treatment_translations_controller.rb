class Admin::TreatmentTranslationsController < AdminController
  
  def index
    @treatments = Treatment.all
  end
  
  def new
    @treatments = Treatment.select(:id, :name).order(:category_id)
    @languages = SupportedLanguage.all
  end

  # Adding new treatment translation
  def create
    treatment = Treatment.find_by(id: params[:treatment_id])
    if treatment.present?
      translation = treatment.treatment_translations.build(
        supported_language_id: params[:supported_language_id],
        translation: params[:translation]
      )

      if translation.save
        redirect_to admin_treatment_translations_path, notice: "Translation created successfully!"
      else
        flash[:error] = "Failed to create translation. Please check the fields and try again."
        render :new
      end
    else
      flash[:error] = "Treatment not found. Please select a valid category."
      render :new
    end
  end
  
end
