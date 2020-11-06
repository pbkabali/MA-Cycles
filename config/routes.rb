Rails.application.routes.draw do
  root 'auth#new'
  resources :likes
  resources :followings
  resources :opinions
  resources :users
  resources :auth, only: [:new, :create, :destroy]

end
