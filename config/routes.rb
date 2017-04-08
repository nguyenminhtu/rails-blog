Rails.application.routes.draw do
  root 'pages#home'

  # route for admin
  namespace :admin do
    get 'index', to: 'adminpages#index'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    resources :posts
    resources :categories
    resources :users, except: [:new]
  end
  # end route admin


  # route for client
  resources :posts, only: [:show]
  resources :categories, only: [:show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, only: [:show, :edit, :update]
  # end client route
end
