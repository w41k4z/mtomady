class CreateTreatments < ActiveRecord::Migration[8.0]
  def change
    create_table :treatments do |t|
      t.string :name, null: false
      t.integer :category_id, null: false
      t.integer :state, null: false
      t.timestamps

      t.foreign_key :categories
    end
  end
end
