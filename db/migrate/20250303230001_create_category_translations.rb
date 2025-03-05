class CreateCategoryTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :category_translations do |t|
      t.integer :category_id, null: false
      t.integer :supported_language_id, null: false
      t.string :translation, null: false
      t.timestamps

      t.foreign_key :categories
      t.foreign_key :supported_languages
      t.index [:category_id, :supported_language_id], unique: true
    end
  end
end
