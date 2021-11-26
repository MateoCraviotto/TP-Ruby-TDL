Rails.application.routes.draw do
  resources :cars
  
  devise_for :users
  resources :users
  
  root to: "home#index"
  
  get "about/index", to: "about#index", as: :about
  
  get "contact/index", to: "contact#index", as: :contact

  
end