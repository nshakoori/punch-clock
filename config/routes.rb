Rails.application.routes.draw do
    root to: 'home#index'
  
    devise_for :users

    resources :punch_records, only: [:index, :create] do
      member do
        post "punch_out", to: "punch_records#punch_out"
      end
    end
    resources :punch_cards, only: [:new, :create]
end
