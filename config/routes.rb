Rails.application.routes.draw do

  get 'card/new'
  get 'card/show'
  root 'posts#index'
  resources :users, only: [:index, :show, :destroy]
  resources :logouts, only: [:index]
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # devise_scope :user do
  #   get 'deliverys', to: 'users/registrations#new_deliverys'
  #   # post 'deliverys', to: 'users/registrations#create_deliverys'
  # end
end
