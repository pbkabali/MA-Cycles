Rails.application.routes.draw do
  resources :likes
  root 'opinions#index'
  
  resources :followings
  resources :opinions
  resources :users
  resources :auth, only: [:new, :create, :destroy]

end
