# config/routes.rb
Rails.application.routes.draw do
  devise_for :users
  root "products#index"  # Встановлюємо сторінку за замовчуванням
  resources :products, only: [:index, :show]

  namespace :admin do
    resources :orders, only: [:index, :show]
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :categories, only: [:index, :new, :create, :edit, :update, :destroy]
  end


  resources :users, only: [:show] do
    resources :orders, only: [:index, :destroy]
  end  

  # Інші маршрути
  resources :orders do
    resource :payment, only: [:new, :create]
    collection do
      get :get_cities
      post :sync_cities
    end
  end

  # Для кошика
  get 'carts/show', to: 'carts#show', as: 'cart'
  post 'carts/add_item', to: 'carts#add_item'
  delete 'carts/remove_item', to: 'carts#remove_item', as: 'remove_item_cart'

  # Для категорій
  resources :categories, only: [:index, :show]

  get '/get_cities', to: 'orders#get_cities'
  get '/get_warehouses_for_city', to: 'orders#get_warehouses_for_city'
end
