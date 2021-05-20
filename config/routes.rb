 Rails.application.routes.draw do

  root 'public/homes#top'
  devise_for :customers, controllers: {

    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admins, controllers: {
    registrations: 'admin/registrations',
    sessions:      'admins/sessions',
    passwords:     'admin/passwords'
  }

  namespace :admin do
    get '/admins' => 'admins#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders,only:[:index,:show,:update]
    resources :order_items, only:[:update]
  end
  namespace :public do
    get '/about' => 'homes#about'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :items, only:[:index,:show,:new] do
        get :search, on: :collection # ジャンル検索機能用
    end
    resources :cart_items
    post '/orders/session' => 'orders#session_create'
    get '/orders/confirm' => 'orders#confirm'
    post '/orders/confirm' => 'orders#confirm'
    get '/orders/thanks' => 'orders#thanks'
    patch '/customers/withdrawal' => 'customers#destroy'
    get '/customers/withdrawal' => 'customers#withdrawal'
    resources :orders, only:[:new,:create,:index,:show]
    resource :customers, only:[:show ,:edit,:update]
    resources :addresses, only:[:index, :edit, :destroy, :create, :update]
  end
end





