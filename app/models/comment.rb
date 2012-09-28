class Comment < ActiveRecord::Base
	
	attr_accessible :body, :post_id, :user_id
	
	belongs_to :posts
	belongs_to :users
	
	validates :post_id, :presence => true	#check for the presence of the post_id input
	validates :body, :presence => true		#check for the presence of the body input
	
	validates :user_id, :presence => true	#check for the presence of the user_id input
	
end
