class ApplicationController < ActionController::Base
    # protected内の「configure_permitted_parameters」を設定
    before_action :configure_permitted_parameters, if: :devise_controller?
  
  
    protected
        # deviseで使えるパラメータを許可する
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [
                :email, 
                :last_name_kana,
                :first_name_kana,
                :last_name,
                :first_name,
                :postal_code,
                :street_address,
                :phone_num,
                :is_deleted
            ])
            devise_parameter_sanitizer.permit(:account_update, keys: [
                :email, 
                :last_name_kana,
                :first_name_kana,
                :last_name,
                :first_name,
                :postal_code,
                :street_address,
                :phone_num,
                :is_deleted
            ])
        end

end
