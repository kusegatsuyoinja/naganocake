class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @addresses = Address.all
    @address = Address.new
  end
  
  def create
    # 特定（今）のユーザーだけが新規保存できるようにする記述がわからない
    address = Address.new(address_params)
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
    # この下のif文のユーザー照合の仕方が合ってるかわからない
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
