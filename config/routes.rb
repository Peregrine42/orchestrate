Rails.application.routes.draw do
  resources :orders do
    resources :lines
  end
end
