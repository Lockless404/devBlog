Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      post 'users/sign_up' => 'users#register'
      post 'users/sign_in' => 'users#login'
      get 'users/:user_id/posts' => 'posts#index'
      post 'users/:user_id/posts' => 'posts#create'
      get 'comments' => 'comments#index'
      post 'comments/create' => 'comments#create'
    end
  end
  resources :users, only: [:index, :show] do
    resources :posts, only: [:destroy, :index, :new, :create, :show ] do
      resources :comments, only: [:create, :new, :destroy]
      resources :likes, only: [:create]
      end
  end
  
  root "users#index"
end
