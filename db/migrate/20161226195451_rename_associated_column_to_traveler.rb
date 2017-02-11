class RenameAssociatedColumnToTraveler < ActiveRecord::Migration[5.0]
  def change
  	rename_column :people, :associated, :traveler
  end
end
