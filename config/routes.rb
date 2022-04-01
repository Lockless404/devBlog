Rails.application.routes.draw do
  get "/users/:id", to: "users#show"

  # Defines the root path route ("/")
  # root "articles#index"
end
