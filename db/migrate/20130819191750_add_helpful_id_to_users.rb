class AddHelpfulIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :helpful_id, :integer
  end
end
