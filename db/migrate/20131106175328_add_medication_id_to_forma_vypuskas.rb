class AddMedicationIdToFormaVypuskas < ActiveRecord::Migration
  def change
    add_column :forma_vypuskas, :medication_id, :integer
  end
end
