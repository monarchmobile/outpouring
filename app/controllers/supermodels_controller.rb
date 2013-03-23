class SupermodelsController < ApplicationController

	layout 'dashboard'

	def new 
		@supermodel = Supermodel.new
	end

	def index 
		@supermodels = Supermodel.all 
	end

	def show
		find_supermodel
	end

	def create
		@supermodel = Supermodel.find(params[:supermodel])
		respond_to do |format|
			if @supermodel.save
				format.html { redirect_to dashboard_path, "model saved" }
				format.js
			else
				format.html { render 'new', notice: "model not saved" }
				format.js
			end
		end
	end




	def find_supermodel
		@supermodel = Supermodel.find(params[:id])
	end


end