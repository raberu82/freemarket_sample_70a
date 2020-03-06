Rails.application.routes.draw do
  root 'posts#show'
  resources :posts
end
