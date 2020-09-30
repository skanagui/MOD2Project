Rails.application.routes.draw do
  resources :blogs
  resources :users
  resources :location
  resources :blogss
  resources :meetups 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/login", to: "users#login", as: "login"
  post "/login", to: "users#handle_login"

  get "/locations", to: "locations#show"

  # patch "/meetups/:id/edit", to: "meetups#edit", as: "edit_meetup"
end

