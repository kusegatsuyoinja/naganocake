class Public::CustomersController < ApplicationController
    def new
        @customer = Customer.find(current_customer.id)
    end

    def show
        @customer = Customer.find(current_customer.id)
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @item.update(item_params)
          redirect_to admin_item_path(@item.id)
        else
          render "edit"
        end
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
      params.require(:customer).permit(:last_name, :first_name, :last_ruby, :first_ruby, :postal_code, :address, :phone_number, :email)
    end
end
