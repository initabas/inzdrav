class FormaVypuska < ActiveRecord::Base
	attr_accessible :name, :medication_id
	belongs_to :medication
end
