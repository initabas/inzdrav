class AddHelpfulIdToMedications < ActiveRecord::Migration
  def change
    add_column :medications, :helpful_id, :integer
  end
end
