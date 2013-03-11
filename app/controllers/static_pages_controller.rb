class StaticPagesController < ApplicationController
	
  def home
  	# @article = Article.find(1)
  	@article = Article.find(1)
    @comment = @article.comments.build
  end

  def about
    @article = Article.find(1)
    @comment = @article.comments.build
  end

  def bible_study
    @article = Article.find(1)
    @comment = @article.comments.build
  end
end
