Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get "todos", to: "todos#index"
  #post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"

  resources :todos
  resources :users
  get "/" => "home#index"
  get "/signin", to: "sessions#new", as: "new_sessions"
  post "/signin" => "sessions#create", as: "sessions"
  delete "/signout", to: "sessions#destroy", as: "destroy_session"
end
