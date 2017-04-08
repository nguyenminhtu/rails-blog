class UsersController < ApplicationController
	before_action :require_user, only: [:show, :edit, :update]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:uid] = @user.id
			flash[:success] = "Welcome to my blog, #{@user.username}"
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your profile was update successfully"
			redirect_to user_path(@user)
		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id])
		@categories = Category.all.order("created_at DESC")
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password, :password_confirmation)
		end

		def require_user
			if !logged_in?
				flash[:danger] = "You must be login to perform that action"
				redirect_to login_path
			end
		end

end