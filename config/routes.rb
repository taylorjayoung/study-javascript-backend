Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories
  resources :collections
  resources :questions
  resources :sessions

  post'/signup', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
<<<<<<< HEAD

=======
>>>>>>> a970474c0f5e0fdfd4e50d0d2e9746d17dca44de
end
