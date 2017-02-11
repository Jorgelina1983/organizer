class ModifyPersonListsTable < ActiveRecord::Migration[5.0]
  def change
  	remove_column :person_lists, :person_id, :integer
  	remove_column :person_lists, :list_id, :integer
  	remove_column :person_lists, :payments, :string
  	add_reference :person_lists, :person, references: :people, index:true
  	add_reference :person_lists, :list, refereces: :lists, index: true
  	add_column :person_lists, :position, :integer  	
  end
end
