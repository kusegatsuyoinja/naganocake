class Public::AddressesController < ApplicationController
  # before_action :authenticate_customer!
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    address = Address.new(address_params)
    address.save(address_params)
    redirect_to public_addresses_path
  end 
  
  private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end
