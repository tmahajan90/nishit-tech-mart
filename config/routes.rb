Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :clients
  resources :users
  resources :items
  resources :vehicle_details

  root 'dashboards#index'
  constraints format: :json do
    get 'orders/search', to: 'orders#search'
  end
  # get 'renew/:id' => 'orders#renew'
  # get 'return/:id' => 'orders#disable'
  # get 'past_orders' => 'orders#old'
end
