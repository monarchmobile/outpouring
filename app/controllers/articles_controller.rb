 class ArticlesController < ApplicationController 
  # GET /articles
  # GET /articles.json
  before_filter :authenticate_user!, :except => [:show] # devise method
  layout :resolve_layout

  def index
    all_article_states
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  def article_index
    sidebar = Article.find_by_title("Top Sidebar")
    @articles = Article.find(:all, :conditions => ["id != ?", sidebar.id])
    home_article_comment_form
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = @article.comments.build
    # home_article_comment_form

    respond_to do |format|
      format.html
      format.json { render json: @article }
    end
  end

  def article_partial
    @articles_partial = Describe.new(Article).partial
    @model_name = "Article"
    render 'shared/quick_partial_view', model_name: @model_name
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    authorize! :edit, @article
    find_article
  end

  # POST /articles
  # POST /articles.json
  def create
    authorize! :create, @article
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    authorize! :update, @article
    find_article
    all_article_states
    position = params[:article][:position]
    current_state = params[:article][:current_state]
    published = Status.find_by_status_name("published").id
    if (!current_state ==  published) 
      @article.position = nil
    end
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.js { @article }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    authorize! :destroy, @article
    find_article
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def sort
    all_article_states
    params[:article].each_with_index do |id, index|
      Article.update_all({position: index+1}, {id: id})
    end
    render "update.js"
  end

  def article_status
    all_article_states
    find_article
    current_state = params[:article][:current_state]
    total_published = @published_articles.count
    published = Status.find_by_status_name("published").id
    if (current_state == published) 
      @article.update_attributes({current_state: current_state, position: total_published + 1})
    else
      @article.update_attributes({current_state: current_state, position: nil })
    end

    @published_articles.each_with_index do |id, index|
      @published_articles.update_all({position: index+1}, {id: id})
    end
    all_article_states
    render "update.js"
    
  end

  def article_starts_at
    
    find_article
    starts_at = params[:article][:starts_at]
    current_state = params[:article][:current_state]
    total_published = @published_articles.count

    @article.update_attributes({starts_at: starts_at})
    published = Status.find_by_status_name("published").id
    if (current_state ==  published) 
      @published_articles.each_with_index do |id, index|
        @published_articles.update_all({position: index+1}, {id: id})
      end
    end
    
    all_article_states
    render "update.js"
  end

  def article_ends_at
    
    find_article
    ends_at = params[:article][:ends_at]
    current_state = params[:article][:current_state]
    total_published = @published_articles.count
    
    @article.update_attributes({ends_at: ends_at})
    published = Status.find_by_status_name("published").id
    if (current_state ==  published) 
      @published_articles.each_with_index do |id, index|
        @published_articles.update_all({position: index+1}, {id: id})
      end
    end
    all_article_states
    render "update.js"
    
  end

  def all_article_states
    @published_articles = Describe.new(Article).published
    @scheduled_articles = Describe.new(Article).scheduled
    @draft_articles = Describe.new(Article).draft
  end

  
end
