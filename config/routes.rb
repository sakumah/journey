Rails.application.routes.draw do
   devise_for :users
  resources :users, only: [:show]
  resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :tourists,only: [:index, :create, :show, :new] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

  namespace :admin do
    resources :tourists, only: [:edit, :update, :destroy]
  end

  root 'tourists#index'

end
