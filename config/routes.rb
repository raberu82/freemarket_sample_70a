Rails.application.routes.draw do
  # resources :posts, only: [:index, :show, :new, :create] do
  #   collection do
  #     get 'category_children', defaults: { format: 'json' }
  #     get 'category_grandchildren', defaults: { format: 'json' }
  #   end
  # end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    get 'profile', to: 'users/registrations#new_profile'
  end

  get 'purchase/index'
  get 'purchase/done'
  
  
  get 'card/new'
  get 'card/show'

  
  resources :posts do
    collection do
      get 'category_children'
      get 'category_grandchildren'
      get 'search'
    end
  end
  
  resources :users, only: [:index, :show]
  resources :logouts, only: [:index, :destroy]
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      delete 'delete', to: 'card#delete'
    end
  end
  resources :purchase, only: [:show] do
    member do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  root to: "posts#index"
end
