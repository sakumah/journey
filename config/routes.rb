Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  resources :users, only: [:show]
  resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :tourists do
    resources :likes, only: [:create, :destroy]
  end
  root 'tourists#index'

end
