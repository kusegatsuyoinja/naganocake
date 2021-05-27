class Admin::OrderDetailsController < ApplicationController
  #before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    if order_detail.update(order_detail_params)
     flash[:notice] = "更新ができました！"
     redirect_to request.referer
    else
     render :show
     flash.now[:alert] = "更新ができませんでした・・・"
    end
  end
  
  private
  def order_detail_params
    params.require(:order_detail).permit(:work_status)
  end
end
