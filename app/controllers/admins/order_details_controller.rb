class Admins::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.update(order_detail_params)
            redirect_to request.referer
        else
            @order = Order.find(params[:id])
            @customer = @order.customer_id
            @order_details = OrderDetail.where(order_id: @order.id)
            render 'admins/orders/show'
        end
    end

    private
        def order_detail_params
            params.require(:order_detail).permit(:making_status)
        end
        
end
