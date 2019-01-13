Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index] do
    post :promote
    delete :demote
  end

  resources :products, only: [:index]
  get "roles/upgrade_premium"
  
  root "products#index"
end
