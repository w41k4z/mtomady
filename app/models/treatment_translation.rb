class TreatmentTranslation < ApplicationRecord
  belongs_to :treatment
  belongs_to :supported_language
end
