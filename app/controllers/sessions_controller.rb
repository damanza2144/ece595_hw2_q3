class SessionsController < ApplicationController
	
	skip_before_filter :authorize

  def new
  end

  def create

	@username = params[:name]
	@password = params[:password]
	
	if user = User.authenticate(params[:name], params[:password])
		
		session[:user_id] = user.id
		
		if user.is_admin
			redirect_to admin_url
		else
			redirect_to posts_url
		end
		
	else
		redirect_to login_url, :alert => "Invalid user/password"
	end
	
  end

  def destroy
  
	session[:user_id] = nil
	redirect_to blog_url, :notice => "Logged Out"
  
  end
end
