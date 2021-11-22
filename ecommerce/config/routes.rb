Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  
  root to: "home#index"
  
  get "about/index", to: "about#index", as: :about
  
  get "contact/index", to: "contact#index", as: :contact
    
  get "products/new", to: "products#create", as: :new_product
  get "products/:id/edit", to: "products#edit", as: :edit_product
  get "products/:id/show", to: "products#show", as: :show_product
  get "products", to: "products#index", as: :show_products
  get "products/add", to: "products#add", as: :add_products
  get "products/import", to: "products#my_import", as: :import_products
  get "products/destroy", to: "products#destroy_all", as: :destroy_products
  delete "products/:id", to: "products#destroy", as: :delete_product

  resources :products do
    collection {post :import}
  end

end