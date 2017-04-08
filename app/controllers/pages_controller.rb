class PagesController < ApplicationController

	def home
		@categories = Category.all.order('created_at DESC')
		@posts = Post.paginate(page: params[:page], per_page: 5).order('created_at DESC')
		render 'home'
	end

end