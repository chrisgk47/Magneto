Rails.application.routes.draw do

  resources :categories
  resources :bookmarks
  resources :listings
  resources :user_categories
  resources :users

  
  get '/login', to: 'sessions#new_login', as: "new_login"
  post '/login', to: 'sessions#login'

end
