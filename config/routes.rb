Rails.application.routes.draw do
  get 'welcome', to: 'users#welcome'
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
end
