Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :checkups do
    resources :user_analyses, only: :update
  end
  resources :user_analyses, only: [:index, :destroy]

  resources :pdfs, only: [:create]
end
