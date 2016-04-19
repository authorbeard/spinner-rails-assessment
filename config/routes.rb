Rails.application.routes.draw do
  devise_for :users
  as :user do
    get "/signin" => "devise/sessions#new"
    get "/signout" => "devise/sessions#destroy"
  end
  
  get '/', to: "static#home"
  root'static#home'

  resources :songs
  resources :artists
  resources :albums
  
  resources :users, only: [:show, :edit, :update, :destroy]
  

  
  

  end
