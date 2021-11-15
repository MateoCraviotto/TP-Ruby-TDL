class ProductsController < ApplicationController

    def create
    end

    def edit
    end

    def show
        @products = Product.all
    end

    def import
        Product.my_import(params[:file])
        redirect_to products_path, notice: "Data successfully imported"
    end

    def destroy
    end

end
