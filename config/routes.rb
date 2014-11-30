Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :projects
  post '/projects/', to:'projects#create', as: :create
  post '/projects/:id/delete', to: 'projects#delete', as: "delete"

end
