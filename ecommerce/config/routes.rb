Rails.application.routes.draw do
  resources :cars do
    resources :questions
  end
  
  devise_for :users
  resources :users
  
  root to: "home#index"
  
  get "about", to: "about#index", as: :about
  get "contact", to: "contact#index", as: :contact

  get "active_posts", to: "cars#active_posts"

  #no tocar
  get "cars/:car_id/questions/:id/answer", to: "questions#answer", as: :answer
  post "cars/:car_id/questions/:id/answer", to: "questions#answer"
  patch "cars/:car_id/questions/:id/answer", to: "questions#update"

end