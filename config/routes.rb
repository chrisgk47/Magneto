Rails.application.routes.draw do

  resources :categories, only: [:index, :show]
  resources :bookmarks, only: [:index, :show, :new, :create]
  resources :listings, only: [:index, :show]
  resources :user_categories, only: [:index]
  resources :users, only: [:index, :show, :create, :new, :edit, :destroy, :update]

  # post "/bookmarks" => "bookmarks_controller#create", :as => :create_bookmark
  # post "/bookmarks", "bookmarks#create_bookmark", as => :create_bookmark
  delete '/bookmarks/:id', to: 'bookmarks#destroy'
  get '/login', to: 'sessions#new_login', as: "new_login"
  post '/login', to: 'sessions#login'

end
