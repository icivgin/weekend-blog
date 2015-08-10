Rails.application.routes.draw do
  

  get "/signup", to: "users#new"
  post "/users", to: "users#create"
  get "/profile", to: "users#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  root 'posts#index'
  get "/posts/delete/:id", to: "posts#destroy"

  resources :posts, except: [:index]
end
