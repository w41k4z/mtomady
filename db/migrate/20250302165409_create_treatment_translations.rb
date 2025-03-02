class CreateTreatmentTranslations < ActiveRecord::Migration[8.0]
  def change
    create_table :treatment_translations, id: false do |t|
      t.integer :treatment_id, null: false
      t.integer :supported_language_id, null: false
      t.string :translation, null: false
      t.timestamps

      t.foreign_key :treatments
      t.foreign_key :supported_languages
      t.primary_key [:treatment_id, :supported_language_id]
    end
  end
end
