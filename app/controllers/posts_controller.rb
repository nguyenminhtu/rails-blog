class PostsController < ApplicationController

	def show
		@categories = Category.all.order("created_at DESC")
		@post = Post.find(params[:id])
	end

end