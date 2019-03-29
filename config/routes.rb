Rails.application.routes.draw do
  resources :users
  resources :categories
  resources :collections
  resources :questions
  resources :sessions
<<<<<<< HEAD
  resources :questions_collection
=======
  resources :questions_collections
>>>>>>> b9a84ee6964bce66504d27b3eb7247774de076ea

  get '/', to: 'application#standard'
  post'/signup', to: 'users#create'

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

<<<<<<< HEAD
  # post '/category_question', to: 'questions#create'
    # => question.create
    # question_catoegry.create with the above id
=======
>>>>>>> b9a84ee6964bce66504d27b3eb7247774de076ea
end
