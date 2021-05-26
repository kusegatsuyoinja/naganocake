class Admin::OrdersController < ApplicationController
  #before_action :authenticate_admin!
  
  def index
    @orders = Order.all
    
    if params[:key] =="order_history"
      @orders=current_customer.orders
    else
      @orders=Order.all
    end
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
    @total = 0
  end 
  
  def update
    order = Order.find(params[:id])
    if order.update(order_params)
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
