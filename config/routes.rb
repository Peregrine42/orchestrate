Rails.application.routes.draw do
  resources :orders do
    resources :lines
    resources :archived_lines
  end
end
