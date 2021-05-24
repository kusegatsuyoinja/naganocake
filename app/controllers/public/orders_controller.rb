class Public::OrdersController < ApplicationController
  
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
  
  private
  
  def order_params
    params.require(:order).permit(:payment_method )
  end
  
  def address_params
    #params.permit(:address, :name, :postal_code, :customer_id)
    params.require(:order).permit(:address, :name, :postal_code, :customer_id)
  end
  
  
end
