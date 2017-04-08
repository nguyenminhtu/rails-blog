class Admin::AdminpagesController < ApplicationController
	before_action :require_admin

	def index
		render 'index'
	end

end