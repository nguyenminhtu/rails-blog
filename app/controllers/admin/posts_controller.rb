class Admin::PostsController < ApplicationController
	before_action :require_admin
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.paginate(page: params[:page], per_page: 10)
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = User.first
		if @post.save
			flash[:success] = "Post was created successfully"
			redirect_to admin_posts_path
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		if @post.update(post_params)
			flash[:success] = "Post was updated successfully"
			redirect_to admin_post_path(@post)
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:success] = "Post was deleted successfully"
	end


	private
		def set_post
			@post = Post.find(params[:id])
		end

		def post_params
			params.require(:post).permit(:title, :description, category_ids: [])
		end

end