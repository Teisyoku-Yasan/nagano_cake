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
        if @customer.update(customer_params)
            redirect_to admins_customer_path(@customer), notice: "会員情報を更新しました"
        else
            render :edit
        end
    end

    #検索用アクション
    def search
        @customer_or_product = params[:option]
        if @customer_or_product == "1"
            @customers = Customer.search(params[:search], @customer_or_product)
        else
            @products = Product.search(params[:search], @customer_or_product)
        end
        @search = params[:search]
    end



    private
        def customer_params
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
