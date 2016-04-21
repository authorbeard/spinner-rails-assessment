Rails.application.routes.draw do
  get '/', to: "static#home"
  root'static#home'

  devise_for :users, :controllers=>{ :omniauth_callbacks => 'users/omniauth_callbacks'}
  as :user do
    get "/signin" => "devise/sessions#new"
    get "/signout" => "devise/sessions#destroy"
  end

  resources :users, only: [:show, :edit, :update, :destroy]
  
  resources :albums
  # post '/albums/:id/edit', to: "albums#update"
  post '/albums/:id/spin', to: 'albums#spin', as: "spin"
  get '/albums/:id/import_songs', to: 'albums#import_songs', as: 'import_songs'
  post '/albums/:id/add', to: 'albums#add', as: 'add_album'

  resources :users do 
    resources :albums
    post '/add', to: "albums#add", as: "add_album"
    # resources :artists
    # resources :songs
  end
  
  resources :songs
  post '/songs/new', as: "song_importer"

  resources :artists


  

### Routes from discogs-wrapper readme. not sure they're needed.
  # get 'tests/:id' => 'tests#show', :constraints  => {:id => /.+\.\w{3,4}/}

  # resources :oauth do
  #   collection do
  #     get :authenticate
  #     get :callback
  #     get :whoami
  #     get :add_want
  #     get :edit_want
  #     get :remove_want
  #   end
  # end

  end
