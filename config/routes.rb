PhotoStream::Application.routes.draw do
  root 'users#new'

  get '/events/:id/photos', to: 'photos#index', as: 'photos'
  get '/photos/:id', to: 'photos#show', as: 'photo'
  get '/users', to: 'users#index', as: 'users'
  get '/signin', to: 'sessions#new'
  delete '/signout', to: 'sessions#destroy'

  resources :events, :users, :sessions
  # resources :photos, :only => :index
end

# Prefix Verb   URI Pattern                Controller#Action
#       root GET    /                          events#new
#     events GET    /events(.:format)          events#index
#            POST   /events(.:format)          events#create
#  new_event GET    /events/new(.:format)      events#new
# edit_event GET    /events/:id/edit(.:format) events#edit
#      event GET    /events/:id(.:format)      events#show
#            PATCH  /events/:id(.:format)      events#update
#            PUT    /events/:id(.:format)      events#update
#            DELETE /events/:id(.:format)      events#destroy