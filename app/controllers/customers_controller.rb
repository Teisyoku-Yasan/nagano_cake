class CustomersController < ApplicationController

	before_action :authenticate_customer!
	before_action :set_customer, only: [:show, :edit, :update, :withdraw]

	def show
	end

	def edit
	end

	def update
		if @customer.update(customer_params)
			redirect_to customers_path
		else
			render 'edit'
		end
	end

	def unsubscribe
	end

	def withdraw
		@customer.update(is_deleted: true)
		reset_session
		redirect_to root_path
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :postal_code, :street_address, :phone_num, :is_deleted, :email, :password, :active)
	end

	def set_customer
		@customer = current_customer
	end

end
