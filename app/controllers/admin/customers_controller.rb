class Admin::CustomersController < ApplicationController
  
  def destroy
    @admin = current_admin
    @admin.update(is_deleted: false)
    redirect_to root_path
  end
  
end
