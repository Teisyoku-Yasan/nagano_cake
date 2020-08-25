class CustomersController < ApplicationController

	before_action :authenticate_customer!

	def show
		@customer = Customer.find(current_customer.id)
	end

	def edit
		@customer = Customer.find(current_customer.id)
	end

	def update
		@customer = Customer.find(current_customer.id)
		if @customer.update(customer_params)
			redirect_to customers_path
		else
			render 'edit'
		end
	end

	def unsubscribe
	end

	def withdraw
		@customer = Customer.find(current_customer.id)
		@customer.update(is_deleted: true)
		reset_session
		redirect_to root_path
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :postal_code, :street_address, :phone_num, :is_deleted, :email, :password, :active)
	end

end
