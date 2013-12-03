class CreateFormaVypuskas < ActiveRecord::Migration
  def change
    create_table :forma_vypuskas do |t|
      t.string :name

      t.timestamps
    end
  end
end
