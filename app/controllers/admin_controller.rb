class AdminController < ApplicationController

  def index
  
	@user = User.find(session[:user_id])
	@username = @user.name
  
  end

end
