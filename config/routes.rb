Rails.application.routes.draw do
  resources :followings
  resources :opinions
  resources :users
  resources :auth, only: [:new, :create, :destroy]

end
