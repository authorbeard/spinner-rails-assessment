Rails.application.routes.draw do
  devise_for :users
  get '/', to: "static#home"
  root'static#home'

  resources :songs
  resources :artists
  resources :albums
  
  resources :users
  

  
  

  end
