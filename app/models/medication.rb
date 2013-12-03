class Medication < ActiveRecord::Base
  attr_accessible :flaggable, :flagger, :flag, :name, :description, :dosage, :ingredient_ids,
                  :sideeffects, :helpful_id, :role_ids, :helpful_ids, :user_ids, :forma_vypuska_ids
  resourcify
  make_flaggable :helpful, :nonhelpful, :callendar
  has_many :helpfuls, as: :helpfulness
  has_many :forma_vypuskas
  has_many :ingredients
  
  searchable do
  	text :name
  	text :description
    integer :forma_vypuska_ids,
            :multiple => true,
            :stored => true,
            :references => FormaVypuska
    integer :ingredient_ids, 
		        :stored => true,
		        :multiple => true,
		        :references => Ingredient
  end
end
