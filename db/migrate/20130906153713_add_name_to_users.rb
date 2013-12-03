class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, "char(12)"
  end
end
