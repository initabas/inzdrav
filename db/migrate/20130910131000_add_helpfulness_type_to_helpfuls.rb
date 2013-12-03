class AddHelpfulnessTypeToHelpfuls < ActiveRecord::Migration
  def change
    add_column :helpfuls, :helpfulness_type, :string
  end
end
