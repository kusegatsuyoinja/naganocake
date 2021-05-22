class Public::OrdersController < ApplicationController
  
  def new
    @order = Order.new
  end
  
  def confirm
    params[:order][:payment_method] = params[:order][:payment_method].to_i
    @order = Order.new(order_params) 
  
    if params[:order][:address_number] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name+current_customer.first_name

    elsif  params[:order][:address_number] ==  "2"
      @order.postal_code = Address.find(params[:order][:address]).postal_code
      @order.address = Address.find(params[:order][:address]).address
      @order.name = Address.find(params[:order][:address]).name

    elsif params[:order][:address_number] ==  "3"
      @address = Address.new()
      @address.address = params[:order][:address]
      @address.name = params[:order][:name]
      @address.postal_code = params[:order][:postal_code]
      @address.member_id = current_member.id
      if @address.save
      @order.postal_code = @address.postal_code
      @order.name = @address.name
      @order.address = @address.shipping_address
      else
       render "new"
      end
    end
  end
  
end
