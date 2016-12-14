class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
    	
      t.string :first_name
      t.string :last_name
      t.string :identification
      t.string :benefit
      t.string :cell_phone
      t.string :phone
      t.date :dob
      t.string :address
      t.string :address_number
      t.boolean :associated, null: false, default: false
       
      t.timestamps null: false
    end
  end

  def self.down
  	drop_table :people
  end
end
