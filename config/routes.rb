Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #get "todos", to: "todos#index"
  #post "todos", to: "todos#create"
  #get "todos/:id", to: "todos#show"

  get "users/passworderror", to: "users#passworderror"
  resources :todos
  resources :users
  post "users/login", to: "users#login"
  get "/" => "home#index"
  get "users/passworderror", to: "users#passworderror"
end
