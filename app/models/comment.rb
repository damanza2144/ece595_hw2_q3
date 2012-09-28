class Comment < ActiveRecord::Base
	
	attr_accessible :body, :post_id
	
	belongs_to :posts
	
	validates :post_id, :presence => true	#check for the presence of the post_id input
	validates :body, :presence => true		#check for the presence of the body input
	
end
