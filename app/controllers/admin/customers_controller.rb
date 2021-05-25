class Admin::CustomersController < ApplicationController
    
    def index
        @customers = Customer.all
    end 
    
    def show
        @customer = Customer.find(params[:id])
    end 
    
    def edit
        @customer = Customer.find(params[:id])
    end 
    
    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
          redirect_to admin_customer_path(@customer)
        end 
    end
    
    private
    def customer_params
        params.require(:customer).permit(:last_name, :first_name, :last_ruby, :first_ruby, :postal_code, :address, :phone_number, :email, :is_deleted)
    end

    

  
  def destroy
    @admin = current_admin
    @admin.update(is_deleted: false)
    redirect_to root_path
  end
  
end
