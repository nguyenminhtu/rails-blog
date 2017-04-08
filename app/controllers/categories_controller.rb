class CategoriesController < ApplicationController

	def show
		@categories = Category.all.order("created_at DESC")
		@category = Category.find(params[:id])
		@category_posts = @category.posts.paginate(page: params[:page], per_page: 5).order("created_at DESC")
	end

end