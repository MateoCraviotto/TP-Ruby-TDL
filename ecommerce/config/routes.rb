Rails.application.routes.draw do
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "about/index", to: "about#index", as: :about
  get "contact/index", to: "contact#index", as: :contact
  get "catalogue/index", to: "catalogue#index", as: :catalogue
  get "products/new", to: "products#create", as: :new_product
  get "products/edit", to: "products#edit", as: :edit_product
end
