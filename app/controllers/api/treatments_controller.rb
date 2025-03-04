class Api::TreatmentsController < ApplicationController
  def index
    lang = params[:lang] || "en"
    @treatments = TreatmentView.where(lang: lang)
    render json: @treatments
  end
end
