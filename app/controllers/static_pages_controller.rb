class StaticPagesController < ApplicationController
	before_filter :authenticate_user!
	layout 'dashboard'

	def dashboard
		@pages = Page.all
		@articles = Article.all(:order => "featured DESC")
		@contact = Contact.first
		@visible_models = Supermodel.where(visible: true)
		home_article_comment_form
	end
  

  
end
