# Mapping all_treatments view to this model
class TreatmentView < ApplicationRecord
  self.table_name = :all_treatments
end
