class Admins::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!
    
    def update
        @order_detail = OrderDetail.find(params[:id])
        if @order_detail.update(order_detail_params)
            #製作ステータスが2(製作中)になったら注文ステータスも2(製作中)にする。
            if @order_detail.making_status == 2
                @order = Order.find(@order_detail.order_id)
                @order.update(order_status: 2)
                @order_detail.update(order_detail_params)
                redirect_to request.referer, notice: "製作ステータスを更新しました"
            #１オーダー内の製作ステータスが全て3(製作完了)になったら注文ステータスを3(発送準備中)にする
            elsif @order_detail.order.order_details.all?{|order_detail| order_detail.making_status == 3}
                @order = Order.find(@order_detail.order_id)
                @order.update(order_status: 3)
                @order_detail.update(order_detail_params)
                redirect_to request.referer, notice: "製作ステータスを更新しました"
            else
                @order_detail.update(order_detail_params)
                redirect_to request.referer, notice: "製作ステータスを更新しました"
            end
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
