class ProductsController < ApplicationController
  before_filter :authorize, except: [:index, :show]

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    respond_to do |format|
      format.html { redirect_to '/' }
      format.js
    end
  end

  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product Created!"
      redirect_to '/'
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    if @product.save
      flash[:notice] = "Product Updated!"
    else
      flash[:alert] = "Product could not be updated."
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product removed."
    binding.pry
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
