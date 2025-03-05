class Api::TreatmentsController < ApplicationController
  def index
    lang = params[:lang]&.split('-')&.first || "en"
    category_id = params[:category_id]
    
    # Fetch treatments, using TreatmentView to handle language and category filtering.
    # TreatmentView is a database view that merges treatments and their translations, 
    # making it easier to query treatments directly with language support.
    # The query matches the language prefix (e.g., "en" matches "en-US") and 
    # optionally filters by category_id if provided.
    query = TreatmentView.where("lang ILIKE ?", "#{lang}%")
    query = query.where(category_id: category_id) if category_id.present?

    @treatments = query
    render json: @treatments
  end

  def show
    lang = params[:lang]&.split('-')&.first || "en"
    id = params[:id]

    treatment = TreatmentView.find_by(treatment_id: id, lang: lang)
    
    if treatment
      render json: treatment
    else
      render json: { error: "Treatment not found" }, status: :not_found
    end
  end
end
