class AddHelpfulnessIdToHelpfuls < ActiveRecord::Migration
  def change
    add_column :helpfuls, :helpfulness_id, :integer
  end
end
