class CategoryTranslation < ApplicationRecord
  belongs_to :category
  belongs_to :supported_language
end
