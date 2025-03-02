class AddColumnNameToSupportedLanguages < ActiveRecord::Migration[8.0]
  def change
    add_column :supported_languages, :name, :string, null: false
  end
end
