class CreateLists < ActiveRecord::Migration[4.2]
  def change
    create_table :lists do |t|
    	t.string :name, null: false
    	t.integer :schema_id
    	t.string :columns
      	t.timestamps null: false
    end
  end
end
