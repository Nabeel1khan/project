Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  resources :articles do
    resources :likes
  end

  devise_scope :user do  
     get '/users/sign_out' => 'devise/sessions#destroy'     
  end
  post '/create_like', to: 'likes#create'
  post '/unlike_comment', to: 'likes#destroy'
  root "home#index"
  resources :home1
  resources :articles
  resources :articleshow
  resources :articles do
  resources :comments
  resources :users
  end
  end