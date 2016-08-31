Rails.application.routes.draw do
  get '/', to: 'users#home'
  get '/new', to: 'users#new'
  post 'create', to: 'users#create'
  post 'destroy', to: 'users#destroy'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
