Rails.application.routes.draw do
  resources :categories,  only:[:index, :show]
  resources :bookmarks, only:[:index, :show, :new, :create, :edit, :update]
  resources :listings, only: [:index, :show]
  resources :user_categories, only:[:index, :show]
  resources :users, only:[:create, :new, :update, :edit, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
