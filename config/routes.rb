Rails.application.routes.draw do
  get '/', to: "static#home"
  root'static#home'

  devise_for :users
  as :user do
    get "/signin" => "devise/sessions#new"
    get "/signout" => "devise/sessions#destroy"
  end

  resources :users, only: [:show, :edit, :update, :destroy]
  
  resources :albums
  # post '/albums/:id/edit', to: "albums#update"
  post '/albums/:id/spin', to: 'albums#spin', as: "spin"
  post '/albums/:id/import', to: 'albums#import', as: 'import'
  post '/albums/:id/add', to: 'albums#add', as: 'add_album'

  resources :users do 
    resources :albums
    # resources :artists
    # resources :songs
  end


  
  resources :songs
  post '/songs/new', as: "song_importer"

  resources :artists

  end
