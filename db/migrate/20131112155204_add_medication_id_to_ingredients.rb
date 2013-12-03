class AddMedicationIdToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :medication_id, :integer
  end
end
