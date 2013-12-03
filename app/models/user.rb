class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :flaggable, :flagger, :flag, :name
  make_flagger
  has_many :helpfuls
  
  searchable do
  	text :name
  end
end
