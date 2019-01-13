Rails.application.routes.draw do
  devise_for :users

  resources :products, only: [:index]

  get "roles/upgrade_premium"
  
  root "products#index"
end
