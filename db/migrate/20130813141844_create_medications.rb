class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.string :name
      t.text :description
      t.text :dosage
      t.text :sideeffects

      t.timestamps
    end
  end
end
