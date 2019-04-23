Rails.application.routes.draw do

  devise_for :users
  resources :products
  root to: 'products#index'

  authenticated :user do
    root 'products#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
end
