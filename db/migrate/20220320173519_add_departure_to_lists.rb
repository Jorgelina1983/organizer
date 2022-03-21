class AddDepartureToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :departure, :date
  end
end
