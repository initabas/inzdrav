class AddMedicationIdToHelpfuls < ActiveRecord::Migration
  def change
    add_column :helpfuls, :mediation_id, :integer
  end
end
