Rails.application.routes.draw do

  root 'homes#index'
  
  resources :users, only: [:index, :show, :destroy]
  resources :logouts, only: [:index]
  resources :cards, only: [:index]


end
