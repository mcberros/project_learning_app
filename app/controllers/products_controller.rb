class ProductsController < ApplicationController
  skip_before_filter :require_login
  
  respond_to :html

  def index
    @products = Product.all
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(params[:product]) 
    if @product.save
      redirect_to products_url
    else
      render :new
    end 
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      redirect_to @product, notice: 'Product successfully changed'
    else
      render action: 'edit'   
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end
  
  def edit_multiple
    @products = Product.find(params[:product_ids])
  end
  
  def update_multiple
    @products = Product.find(params[:product_ids])
    @products.each do |product|
      product.update_attributes!(params[:product].reject { |k,v| v.blank? })
    end
    flash[:notice] = "Updated products!"
    redirect_to products_path
  end
  
  
end
  
