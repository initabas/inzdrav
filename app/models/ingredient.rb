class Ingredient < ActiveRecord::Base
	attr_accessible :name, :description, :ingredient_group_id
	belongs_to :medication

end
