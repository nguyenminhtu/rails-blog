class Admin::UsersController < ApplicationController
	before_action :require_admin
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def index
		@users = User.paginate(page: params[:page], per_page: 10)
	end

	def show
		@user_posts = @user.posts.paginate(page: params[:page], per_page: 5)
	end

	def edit
		
	end

	def update
		if @user.update(user_params)
			flash[:success] = "User was updated successfully"
			redirect_to admin_user_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@user.destroy
		flash[:success] = "User was deleted successfully"
		redirect_to admin_users_path
	end


	private
		def set_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:admin)
		end

end