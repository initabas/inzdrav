class Helpful < ActiveRecord::Base
  attr_accessible :review, :medication_id, :user_id
  belongs_to :helpfulness, polymorphic: true
  belongs_to :user
  has_many   :comments, as: :commentable, dependent: :destroy
  #accepts_nested_attributes_for :medication
end
