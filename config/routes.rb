Rails.application.routes.draw do
  get 'purchase/index'
  get 'purchase/done'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  get 'card/new'
  get 'card/show'

  
  resources :posts 
  
  resources :users, only: [:index, :show]
  resources :logouts, only: [:index, :destroy]
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      delete 'delete', to: 'card#delete'
    end
  end
  
  root to: "posts#index"
end
