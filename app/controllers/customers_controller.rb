class CustomersController < ApplicationController



	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
			redirect_to customer_path(@customer)
		else
			render 'edit'
		end
	end

	def unsubscribe
	end

	def withdraw
		@customer = Customer.find(params[:id])
		@customer.update(is_deleted: "Invalid")
		reset_session
		redirect_to root_path
	end

	private
	def customer_params
		params.require(:customer).permit(:last_name_kana, :first_name_kana, :last_name, :first_name, :postal_code, :street_address, :phone_num, :is_deleted, :email, :password)
	end

end
