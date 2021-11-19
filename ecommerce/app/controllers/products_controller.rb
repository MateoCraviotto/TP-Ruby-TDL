class ProductsController < ApplicationController

    def create
    end

    def edit
    end

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def add
    end

    def import
        Product.my_import(params[:file])
        redirect_to products_path, notice: "Data successfully imported"
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to root_path
    end
end
