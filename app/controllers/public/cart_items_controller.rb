class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = CartItem.all
    @total = 0
  end
  
  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.customer_id = current_customer
    @cart_item.save
    redirect_to cart_items_path
  end
  
  def update
    @cart_item = CartItem.find(params[:cart_item][:id])
    @cart_item.update(quantity: params[:cart_item][:quantity])
    redirect_to cart_items_path
  end
  
  def destroy_all
    @cart_items = current_member.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :price)
  end
end
