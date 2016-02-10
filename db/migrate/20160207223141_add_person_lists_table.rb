class AddPersonListsTable < ActiveRecord::Migration
  def change
  	create_table :person_lists do |t|     
      t.integer :person_id, null: false
      t.integer :list_id, null: false      
      t.string :payments
      t.timestamps null: false
    end
  end
end
