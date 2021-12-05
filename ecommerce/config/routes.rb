Rails.application.routes.draw do
  resources :cars do
    resources :questions
  end
  
  devise_for :users
  resources :users
  
  root to: "home#index"
  
  get "about", to: "about#index", as: :about
  get "contact", to: "contact#index", as: :contact

  get "active_posts", to: "users#active_posts"
  get "purchase_history", to: "users#purchase_history"
  get "sale_history", to: "users#sale_history"

  get "cars/buy/:car_id", to: "cars#buy", as: :buy
  get "cars/buy/confirm_purchase/:car_id", to: "cars#confirm_purchase", as: :confirm_purchase

  get "cars/sort_by_setting/:setting_id", to: "cars#change_sort_by_setting", as: :change_sort_by_setting

  #no tocar
  get "cars/:car_id/questions/:id/answer", to: "questions#answer", as: :answer
  post "cars/:car_id/questions/:id/answer", to: "questions#answer"
  patch "cars/:car_id/questions/:id/answer", to: "questions#update"

end