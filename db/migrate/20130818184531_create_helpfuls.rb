class CreateHelpfuls < ActiveRecord::Migration
  def change
    create_table :helpfuls do |t|
      t.integer :user_id
      t.text :review

      t.timestamps
    end
  end
end
