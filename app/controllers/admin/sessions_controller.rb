class Admin::SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:uid] = user.id
			flash[:success] = "Welcome back, admin"
			redirect_to admin_index_path
		else
			render 'new'
		end
	end

	def destroy
		session[:uid] = nil
		flash[:success] = "You have logged out"
		redirect_to admin_login_path
	end

end