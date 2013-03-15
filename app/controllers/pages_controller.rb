class PagesController < ApplicationController
	before_filter :authenticate_user!, :except => [:show] # devise method
	def new 
		@page = Page.new
		grab_posts
	end

	def index
		@pages = Page.all 
		grab_posts
	end

	def show 
		find_page
		grab_posts
		
	end

	def edit 
		find_page
		grab_posts
	end

	def create 
		@page = Page.new(params[:page])
		respond_to do |format|
			if @page.save
				format.html { redirect_to @page, :notice => "The #{@page.title} page was successfully created" }
				format.js
			else
				format.html { redirect_to "new", :notice => "page could not be created. Please fill out all ** fields"}
			end
		end
	end

	def update
		find_page
		respond_to do |format|
			if @page.update_attributes(params[:page])
				format.html { redirect_to @page, :notice => "The #{@page.title} page was succesfully updated"}
				format.js
			else
				format.html { render :action => "edit"}
			end
		end
	end

	def destroy
		find_page
		@page.destroy
		respond_to do |format|
			format.html { redirect_to root_url, :notice => "The #{@page.title} page was successfully deleted" }
			format.js
		end
	end

	def find_page 
		@page = Page.find(params[:id])
	end

	def grab_posts
		@article = Article.find(1)
    	@comment = @article.comments.build
	end

end