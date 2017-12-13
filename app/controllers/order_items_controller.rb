class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_items.new(item_params)
    if @order.save
      flash[:notice] = "Product added to your order!"
      respond_to do |format|
        format.html { redirect_to products_path }
        format.js
      end
    else
      flash[:alert] = "Product could not be added to your order."
    end
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.update_attributes(item_params)
    if @order.save
      flash[:notice] = "Order Updated!"
    else
      flash[:alert] = "Order could not be updated"
    end
  end

  def destroy
    @order = current_order
    @item = @order.order_items.find(params[:id])
    @item.destroy
    @order.save
    flash[:notice] = "Product removed from your order!"
    respond_to do |format|
      format.html { redirect_to cart_path }
      format.js
    end
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
