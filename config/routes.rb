Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # メインページルーティング
  root 'home#top'
  get 'home/about' => 'home#about'

  # 会員用ルーティング
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }

  get 'customers/:id' => 'customers#show', as: 'customer'
  get 'customers/:id/edit' => 'customers#edit', as: 'edit_customer'
  patch 'customers/:id' => 'customers#update', as: 'update_customer'
    #マイページ表示

    #退会処理
  get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer'
  patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw_customer'


  resources :products, only: [:show, :index]
  resources :genres, only: [:show]
  resources :orders, only: [:new, :index, :create, :show]
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'
  resources :shippings, only: [:index, :create, :edit, :update, :destroy]

  resources :cart_items, only: [:create, :index, :update, :destroy] do
    #カート空にする
    collection do
      delete 'destroy_all'
    end
  end



  # 管理者用ルーティング
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'home/top' => 'home#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :products, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_details, only: [:update]
  end



end
