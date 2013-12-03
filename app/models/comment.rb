class Comment < ActiveRecord::Base
	attr_accessible :content, :user_id, :parent_id
	belongs_to :user
	belongs_to :commentable, polymorphic: :true
	has_ancestry
end
