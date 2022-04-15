Rails.application.routes.draw do
  get 'likes/create'
  get 'comments/create'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end

  root "users#index"
end
