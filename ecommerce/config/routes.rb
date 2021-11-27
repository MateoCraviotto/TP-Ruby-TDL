Rails.application.routes.draw do
  resources :cars
  
  devise_for :users
  resources :users
  
  root to: "home#index"
  
  get "about", to: "about#index", as: :about
  get "contact", to: "contact#index", as: :contact

  get "active_posts", to: "cars#active_posts"
end