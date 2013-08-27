class ArticlesController < ApplicationController
  
  respond_to :html

  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.all
    end
  end

  def show
    @article = Article.find(params[:id])
  end
 
  def new
    @article = Article.new()
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to articles_url
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
      redirect_to @article, notice: 'Article successfully changed'
    else
      render action: 'edit'   
    end
  end
end