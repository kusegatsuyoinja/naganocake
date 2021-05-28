class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @addresses = current_customer.addresses.all
    @address = Address.new
  end
  
  def create
    address = Address.new(address_params)
    address.customer_id = current_customer.id
    if address.save(address_params)
      flash[:notice] = "保存ができました！"
      redirect_to public_addresses_path
    else
      flash.now[:alert] = "保存ができませんでした・・・"
      render :index
    end
  end
  
  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to public_addresses_path
  end 
  
  def edit
    @address = Address.find(params[:id])
    if @address.customer == current_user
      render :edit
    else
      redirect_to admin_genres_path
    end
  end
  
  def update
    address = Address.find(params[:id])
    if address.update(address_params)
      flash[:notice] = "更新ができました！"
      redirect_to public_addresses_path
    else
      render :edit
      flash.now[:alert] = '更新ができませんでした・・・'
    end
  end 
  
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
