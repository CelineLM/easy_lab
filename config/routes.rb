Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: :show
  resources :checkups
  resources :user_analyses, only: [:index]
  resources :analyses, only: [:index, :show]
  resources :laboratories, only: :index
  resources :pdfs, only: [:create]
   resources :messages, only: [:new, :create]

end
