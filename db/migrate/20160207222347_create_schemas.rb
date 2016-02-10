class CreateSchemas < ActiveRecord::Migration
  def change
    create_table :schemas do |t|
      t.string :name, null: false
      t.integer :seats, null: false
      t.string :company
      t.string :seats_schema
      t.timestamps null: false
    end
  end
end
