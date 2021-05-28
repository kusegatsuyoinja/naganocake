class Admin::OrderDetailsController < ApplicationController
  #before_action :authenticate_admin!
  def update
    order_detail = OrderDetail.find(params[:id])
    order = order_detail.order
    
    if order_detail.update(order_detail_params)
        if order_detail.work_status == "製作中"
            order.update(order_status: "製作中")
        elsif order.order_details.count == order.order_details.where(work_status: "制作完了").count
            order.update(order_status: "発送待ち")
        end
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
