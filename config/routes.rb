Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # devise_scope :user do
  #   get 'deliverys', to: 'users/registrations#new_deliverys'
  #   # post 'deliverys', to: 'users/registrations#create_deliverys'
  # end
end
