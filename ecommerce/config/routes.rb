Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: "home#index"
  
  get "about/index", to: "about#index", as: :about
  
  get "contact/index", to: "contact#index", as: :contact
  
  get "catalogue/index", to: "catalogue#index", as: :catalogue
  
  get "products/new", to: "products#create", as: :new_product
  get "products/edit", to: "products#edit", as: :edit_product
  get "products", to: "products#show", as: :products
  get "products/import", to: "products#my_import", as: :import_products

  resources :products do
    collection {post :import}
  end

end
