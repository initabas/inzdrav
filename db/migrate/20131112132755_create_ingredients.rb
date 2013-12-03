class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.integer :ingredient_group_id

      t.timestamps
    end
  end
end
