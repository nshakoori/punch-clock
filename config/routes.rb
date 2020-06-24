Rails.application.routes.draw do
    root to: 'home#index'
  
    devise_for :users

    resources :punch_records, only: [:index, :create, :update]
    resources :punch_cards, only: [:new, :create] #do
    #   member do 
    #     get 'punch_in', to: "punch_cards#punch_in"
    #     get 'punch_out', to: "punch_cards#punch_out"
    #   end
    # end
end
