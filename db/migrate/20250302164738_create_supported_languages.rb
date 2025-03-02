class CreateSupportedLanguages < ActiveRecord::Migration[8.0]
  def change
    create_table :supported_languages do |t|
      t.string :code, null: false
      t.timestamps

      t.index :code, unique: true
    end
  end
end
