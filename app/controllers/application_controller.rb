class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
	  flash[:error] = "Access denied."
	  redirect_to main_app.root_url
  end

  def home_article_comment_form
	@article = Article.featured.last
	if @article 
		@comment = @article.comments.build 
	end
  end

  helper_method :home_article_comment_form

  def after_sign_in_path_for(resource)
	 if current_user.role_ids.include?(1)
	 	pages_path
	 else
	 	root_path
	 end
  end
  
end
