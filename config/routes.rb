PhotoStream::Application.routes.draw do
  root 'sessions#new'

  #get '/events/:id/photos', to: 'photos#index', as: 'photos'
  # get '/photos/:id', to: 'photos#show', as: 'photo'
  get '/users', to: 'users#index', as: 'users'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  # get '/upload/:event_id', to "photos#new", as: 'upload_photos'

  resources :events do
    resources :photos
  end
  
  resources :users, :sessions

end
