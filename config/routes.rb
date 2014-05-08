PhotoStream::Application.routes.draw do
  #root 'sessions#new'
  root 'sessions#index'

  #defining some routes:
  get '/users', to: 'users#index', as: 'users'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/upload/:event_id', to: 'photos#new', as: 'upload'
  post '/upload/:event_id', to: 'photos#create', as: 'create_upload'

  resources :events do
    resources :photos
  end
  
  resources :users, :sessions

end

# match "/stream/:id", to: "photos#index", via: 'get'
# match "/addphoto/:id", to: "photos#new", via: 'get'
