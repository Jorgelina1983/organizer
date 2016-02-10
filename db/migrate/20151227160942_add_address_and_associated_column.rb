class AddAddressAndAssociatedColumn < ActiveRecord::Migration
  def self.up
  	add_column :people, :address, :string
  	add_column :people, :associated, :boolean,  null: false, default: false
  	add_column :people, :address_number, :string
  end

  def self.down
  	remove_column :people, :address
  	remove_column :people, :associated
  	remove_column :people, :address_number
  end
end
