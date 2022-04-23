Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:destroy, :index, :new, :create, :show ] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
      end
  end
  
  root "users#index"
end
