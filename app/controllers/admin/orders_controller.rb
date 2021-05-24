class Admin::OrdersController < ApplicationController
  def index
    @orders = Order
    if params[:key] =="from_maypage"
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
end
