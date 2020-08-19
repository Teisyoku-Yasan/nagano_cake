class Admins::HomeController < ApplicationController
    before_action :authenticate_admin!
    
    def top
        @today_orders = Order.where(created_at: Time.zone.now.all_day).page(params[:page])
    end
end
