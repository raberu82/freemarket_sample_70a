Rails.application.routes.draw do

  root 'posts#index'
  resources :users, only: [:index, :show, :destroy]
  resources :logouts, only: [:index]
  resources :cards, only: [:index]
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # devise_scope :user do
  #   get 'deliverys', to: 'users/registrations#new_deliverys'
  #   # post 'deliverys', to: 'users/registrations#create_deliverys'
  # end
end
