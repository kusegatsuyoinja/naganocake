class Public::CustomersController < ApplicationController
    def new
        @customer = Customer.find(current_customer.id)
    end 
    
    def show
        @customer = Custome
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        @customer = current_customer
        redirect_to public_customers_path
        # @customer = Customer.find(params[:id])
        # if @customer.update(customer_params)
        #   redirect_to public_customers_path(@customer)
        # end 
    end 
    
    def create
        @customer = Customer.find_by(params[:id])
    end 
    
    def destroy
        @customer = current_customer
        @customer.update(is_deleted: false)
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end

    def withdrawal
        @customer = current_customer
    end
    
    
    private
    def customer_params
      params.require(:@customer).permit(:last_name, :first_name, :last_ruby, :first_ruby, :postal_code, :address, :phone_number, :email)
    end
end
