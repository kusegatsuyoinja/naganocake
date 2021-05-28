class Public::ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :genre_id, :puantity)
  end
end
