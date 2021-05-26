class Admin::OrderDetailsController < ApplicationController
  #before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_params)
     flash[:notice] = "更新ができました！"
     redirect_to admin_order_path
    else
     render :show
     flash.now[:alert] = "更新ができませんでした・・・"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status, :quantity)
  end
end
