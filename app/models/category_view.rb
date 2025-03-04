# Mapping all_categories view to this model
class CategoryView < ApplicationRecord
  self.table_name = :all_categories
end
