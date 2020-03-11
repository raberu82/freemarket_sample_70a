Rails.application.routes.draw do
  resources :posts, only: [:index, :show, :new]
  resources :users, only: [:index, :show, :destroy]
  resources :logouts, only: [:index]
  resources :card, only: [:index]
  resources :cards, only: [:index]

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do

    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: "posts#index"

end
