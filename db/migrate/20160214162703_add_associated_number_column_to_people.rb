class AddAssociatedNumberColumnToPeople < ActiveRecord::Migration[4.2]
  def self.up
  	add_column :people, :associated_number, :integer, :null => false, :default => 0
  end

  def self.down
  	remove_column :people, :associated_number
  end
end
