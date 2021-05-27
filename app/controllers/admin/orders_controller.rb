class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!
  
  def index
    @orders = Order.all
    
    # if params[:key] =="order_history"
    #   @orders=Order.all
    # else
    #   @orders=current_customer.orders
    # end
# 　path = Rails.application.routes.recognize_path(request.referer)

# 　# path[:controller]で遷移元コントローラーを、path[:action]でアクションを取得
# 　  if  path[:controller] == "admin/customers/:id" && path[:action] == "show"
#       @order = Order.where(user_id: path[:id])
#     else 
# 　    @orders = Order.all
# 　  end
  end
  
  def show
    @order = Order.find(params[:id])
    # 制作ステータスのform_withに使用
    #@order_details = @order.order_details
    @total = 0
  end 
  
  def update
    order = Order.find(params[:id])
    order_details = order.order_details
    if order.update(order_params)
      if order.order_status == "入金確認"
        order_details.each do |order_detail| 
         order_detail.update(work_status: "制作待ち")
        end 
      end 
     flash[:notice] = "更新ができました！"
     redirect_to admin_order_path
    else
     render :show
     flash.now[:alert] = "更新ができませんでした・・・"
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
