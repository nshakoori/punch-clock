Rails.application.routes.draw do
    root to: 'home#index'
  
    devise_for :users

    resources :punch_records, only: [:index, :create, :update]
    resources :punch_cards, only: [:new, :create]
end
