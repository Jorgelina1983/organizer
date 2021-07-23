class AddPatientFlag < ActiveRecord::Migration[6.0]
  def change
		add_column :people, :patient, :boolean, default: false
  end
end
