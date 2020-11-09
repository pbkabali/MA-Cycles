Rails.application.routes.draw do
  root 'auth#new'
  resources :likes, only: [:create, :destroy]
  resources :followings, only: [:create, :destroy]
  resources :opinions, only: [:index, :create, :destroy]
  resources :users, only: [:index, :new, :show, :create]
  resources :auth, only: [:new, :create, :destroy]
end
