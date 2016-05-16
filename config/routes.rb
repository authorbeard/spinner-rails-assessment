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
  post '/albums/discogs_import', to: 'albums#dicogs_import'

  resources :users do
    resources :albums, only: [:create]
  end
  post "users/:id/albums/:id/remove", to: "users#remove_album", as: "remove_album"
  get "users/:id/collection", to: "users#collection", as: "collection"
    # post '/albums/:id/add', to: "albums#add", as: "add_album"
    # resources :artists
    # resources :songs
  
  
  
  
  resources :songs
  post '/songs/new', as: "song_importer"
  post '/songs/search', to: "songs#search", as: "song_search"

  resources :artists do 
    resources :albums
  end


  get "/auth", to: "discogs#start_req", as: "authorize_discogs"
  get "/callback", to: "discogs#callback", as: "discogs_callback"
  post "/discogs/search", to: "discogs#search", as: "discogs_search"



  

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
