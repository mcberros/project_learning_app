class CategoriesController < ApplicationController
  skip_before_filter :require_login
  
  respond_to :html

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(params[:category]) 
    if @category.save
      redirect_to categories_url
    else
      render :new
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(params[:category])
      redirect_to @category, notice: 'Category successfully changed'
    else
      render action: 'edit'   
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url
  end
end
  
