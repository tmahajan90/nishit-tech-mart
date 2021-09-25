Rails.application.routes.draw do
  devise_for :users
  resources :orders
  resources :members
  resources :users
  resources :items
  resources :vehicle_details

  root 'dashboards#index'
  get 'renew/:id' => 'orders#renew'
  get 'return/:id' => 'orders#disable'
  get 'past_orders' => 'orders#old'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
