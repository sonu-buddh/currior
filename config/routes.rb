Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :orders
  get "search_order", to: "orders#search_order"
  get 'dashboard/index'
  root 'dashboard#index'
end
