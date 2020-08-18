class Admins::CustomersController < ApplicationController
    before_action :authenticate_admin!

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
        if @customer.update(params_customer)
            redirect_to admins_customer_path(@customer)
        else
            render: edit
        end
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
