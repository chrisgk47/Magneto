Rails.application.routes.draw do

  resources :categories
  resources :bookmarks
  resources :listings
  resources :user_categories
  resources :users

  # post "/bookmarks" => "bookmarks_controller#create", :as => :create_bookmark
  # post "/bookmarks", "bookmarks#create_bookmark", as => :create_bookmark
  
  get '/login', to: 'sessions#new_login', as: "new_login"
  post '/login', to: 'sessions#login'

end
