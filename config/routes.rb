Rails.application.routes.draw do
  root 'restaurants#index'
  resources :restaurants, only: [:index, :create]

  get 'users/login' => 'users#login'
  post 'users/login' => 'users#login_create'
  resources :users, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
