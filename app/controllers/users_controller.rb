class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
  
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
	
		@users = User.order(:name)

		respond_to do |format|
		  format.html # index.html.erb
		  format.json { render json: @users }
		end

	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
	
		@user = User.find(params[:id])

		respond_to do |format|
		  format.html # show.html.erb
		  format.json { render json: @user }
		end
	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end

  # GET /users/new
  # GET /users/new.json
  def new
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
	
		@user = User.new

		respond_to do |format|
		  format.html # new.html.erb
		  format.json { render json: @user }
		end
	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end

  # GET /users/1/edit
  def edit
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
		@user = User.find(params[:id])
	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end

  # POST /users
  # POST /users.json
  def create
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
		@user = User.new(params[:user])

		respond_to do |format|
		  if @user.save
			format.html { redirect_to(users_url, notice: 'User was successfully created.') }
			format.json { render json: @user, status: :created, location: @user }
		  else
			format.html { render action: "new" }
			format.json { render json: @user.errors, status: :unprocessable_entity }
		  end
		end
	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
		@user = User.find(params[:id])

		respond_to do |format|
		  if @user.update_attributes(params[:user])
			format.html { redirect_to(users_url, notice: 'User was successfully updated.') }
			format.json { head :no_content }
		  else
			format.html { render action: "edit" }
			format.json { render json: @user.errors, status: :unprocessable_entity }
		  end
		end
	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
	@current_user = User.find(session[:user_id])
	if @current_user.is_admin 
		@user = User.find(params[:id])
		@user.destroy

		respond_to do |format|
		  format.html { redirect_to users_url }
		  format.json { head :no_content }
		end
	else
	
		respond_to do |format|
			format.html { redirect_to users_url }
			format.json { head :no_content }
		end
		
	end
  end
end
