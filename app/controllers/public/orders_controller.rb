class Public::OrdersController < ApplicationController
  # before_action :authenticate_customer!
  
  def index
    @orders = Order.all
    # @orders = current_customer.orders
  end
  
  def show
    @order = order.find(params[:id])
  end 
  
  def new
    @order = Order.new
  end
  
  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params) 
    
    @cart_items = current_customer.cart_items
    @sub_total = 0

      @cart_items.each do |cart_item|
      @sub_total += (cart_item.item.price*1.1).floor*cart_item.quantity
      end
    @order.postage = 800
    @bill = 0
    @bill = @sub_total + @order.postage
  
    if params[:order][:address_number] == "1"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name+current_customer.first_name

    elsif  params[:order][:address_number] ==  "2"
      @order.delivery_postal_code = Address.find(params[:order][:address]).postal_code
      @order.delivery_address = Address.find(params[:order][:address]).address
      @order.delivery_name = Address.find(params[:order][:address]).name

    elsif params[:order][:address_number] ==  "3"
      @address = Address.new(address_params)
      # @address.address = params[:order][:address]
      # @address.name = params[:order][:name]
      # @address.postal_code = params[:order][:postal_code]
      @address.customer_id = current_customer.id
      if @address.save
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_name = @address.name
      @order.delivery_address = @address.address
      else
       render "new"
      end
    end
  end
  
  def create
    @order = Order.new(order_create_params)
    @order.customer_id = current_customer.id
    @sub_total = 0
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    @sub_total += (cart_item.item.price*1.1).floor*cart_item.quantity
    end
    @order.postage = 800
    @bill = 0
    @bill = @sub_total + @order.postage
    @order.order_status = "入金待ち"
    @order.bill = @bill
    @order.save
    
    
    
    @order_cart_items = current_customer.cart_items
    @order_cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.quantity = cart_item.quantity
      @order_detail.price = (cart_item.item.price*1.1).floor
      @order_detail.work_status = "制作不可"
      @order_detail.save
    end
    @order_cart_items.destroy_all
    
    
    redirect_to public_orders_thanks_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method )
  end
  
  def order_create_params
    params.require(:order).permit(:payment_method, :delivery_postal_code, :delivery_address, :delivery_name, :bill, :customer_id)
  end
  
  def address_params
    #params.permit(:address, :name, :postal_code, :customer_id)
    params.require(:order).permit(:address, :name, :postal_code, :customer_id)
  end
  
  
end
