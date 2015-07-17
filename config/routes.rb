Rails.application.routes.draw do

  root to: 'static_pages#index'
  get '/login', to: 'sessions#new'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  post '/sessions', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get '/signup', to: 'users#new'

  get '/account', to: 'users#show'
  post '/account/token_reset', to: 'users#reset_token'

  resources :users

  get 'arts/index'
  get 'venues/index'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :arts, only: [:index, :edit, :show, :delete]
      resources :venues, only: [:index]
    end
  end


end
# Prefix Verb   URI Pattern               Controller#Action
#   root GET    /                         static_pages#index
#  login GET    /login(.:format)          sessions#new
#  about GET    /about(.:format)          static_pages#about
# contact GET    /contact(.:format)        static_pages#contact
# sessions POST   /sessions(.:format)       sessions#create
# logout GET    /logout(.:format)         sessions#logout
# signup GET    /signup(.:format)         users#new
#  users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
# new_user  GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#   user    GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
