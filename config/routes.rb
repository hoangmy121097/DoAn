Rails.application.routes.draw do

  
  resources :line_items
  resources :carts
  get 'store/index'
  devise_for :users
  resources :products
    
  root to: 'store#index'

  authenticated :user do
    root 'store#index', as: 'authenticated_root'
  end
  devise_scope :user do
    root 'devise/sessions#new'
  end
  resources :abouts
  root 'abouts#index'
end

