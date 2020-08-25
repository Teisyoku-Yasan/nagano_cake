class ApplicationController < ActionController::Base
    # protected内の「configure_permitted_parameters」を設定
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    # アカウント登録後のリダイレクト先（とりあえずrootにしてます。）
    def after_sign_up_path_for(resource)
        root_path
    end
    
    # ログイン後のリダイレクト先（とりあえずrootにしてます。）
    def after_sign_in_path_for(resource)
        root_path
    end
    
    # ログアウト後のリダイレクト先
    def after_sign_out_path_for(resource)
        root_path
    end 

  
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
        end

end
