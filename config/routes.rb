Rails.application.routes.draw do
  root "orders#index"  
  resources :orders do
    resources :lines
    resources :archived_lines
  end
  resources :archived_orders
  resources :stocks
  resources :products
end
