Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :collections
  resources :questions
  resources :sessions
  resources :questions_collections

  get '/', to: 'application#standard'
  post'/signup', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
