class Public::CustomersController < ApplicationController
    
    def show
      @customer = Customer.find(current_customer.id)
    end 
    
    
    
    # private
    # def customer_params
    #   params.require(:@customer).permit(:name, :postal_code, :address, :phone_number, :email)
    # end
end
