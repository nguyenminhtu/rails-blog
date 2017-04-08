class Admin::CategoriesController < ApplicationController
	before_action :require_admin
	before_action :set_category, only: [:show, :edit, :update, :destroy]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 10)
	end

	def show
		@category_posts = @category.posts.paginate(page: params[:page], per_page: 5)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Category was created successfully"
			redirect_to admin_categories_path
		else
			render 'new'
		end
	end

	def edit

	end

	def update
		if @category.update(category_params)
			flash[:success] = "Category was updated successfully"
			redirect_to admin_category_path(@category)
		else
			render 'edit'
		end
	end

	def destroy
		@category.destroy
		flash[:success] = "Category was deleted successfully"
		redirect_to admin_categories_path
	end


	private
		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end


end