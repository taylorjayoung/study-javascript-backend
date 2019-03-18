Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :collections
  resources :questions
  resources :sessions
  resources :questions_collection

  get '/', to: 'application#standard'
  post'/signup', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # post '/category_question', to: 'questions#create'
    # => question.create
    # question_catoegry.create with the above id
end
