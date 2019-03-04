Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories
  resources :collections
  resources :questions

  post '/login', to: 'sessions#create'
end
