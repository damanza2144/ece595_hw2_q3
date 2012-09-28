class ApplicationController < ActionController::Base

	before_filter :authorize
	protect_from_forgery
	
	#private
	
	#def current_user
	#	User.find(session[:user_id])
	#end
	
	protected
	
	def authorize
	
		unless User.find_by_id(session[:user_id])
			redirect_to login_url, :notice => "Please Log In"
		end
	
	end
	
end
