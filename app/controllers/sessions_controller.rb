class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:uid] = user.id
			flash[:success] = "Welcome back, #{user.username}"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def destroy
		session[:uid] = nil
		flash[:success] = "You have logged out"
		redirect_to root_path
	end

end