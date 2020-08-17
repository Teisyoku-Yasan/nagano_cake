class Admins::CustomersController < ApplicationController
    def index
        @customers = Customer.page(params[:page])
    end

    def show
        @customer = Customer.find(params[:id])
    end

    def edit
        @customer = Customer.find(params[:id])
    end
    
    def update
        @customer = Customer.find(params[:id])
        @customer.update(params_customer)
        redirect_to admins_customer_path(@customer)
    end



    private
        def params_customer
            params.require(:customer).permit(
            :last_name_kana, 
            :first_name_kana, 
            :last_name, 
            :first_name, 
            :postal_code, 
            :street_address, 
            :phone_num, 
            :is_deleted)
        end


end
