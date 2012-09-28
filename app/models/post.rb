class Post < ActiveRecord::Base
	
	attr_accessible :body, :title, :user_id
	
	has_many :comments
	belongs_to :users
	
	validates :title, :presence => true
	validates :body, :presence => true
	
	validates :user_id, :presence => true	#check for the presence of the user_id input
	
end
