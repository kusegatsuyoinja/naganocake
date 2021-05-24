class Public::CustomersController < ApplicationController
    def new
        @customer = Customer.find(current_customer.id)
    end 
    
    def show
        @customer = Customer.find(current_customer.id)
    end
    
    def edit
        @customer = Customer.find_by(params[:id])
    end 
    
    def create
        @customer = Customer.find_by(params[:id])
    end 
    
    def destroy
        @customer = Customer.find_by(params[:id])
    end

    def withdrawal
        @customer = Customer.find_by(params[:id])
        @customer.update(is_deleted: false)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
    
    
    private
    def customer_params
      params.require(:@customer).permit(:name, :postal_code, :address, :phone_number, :email)
    end
end
