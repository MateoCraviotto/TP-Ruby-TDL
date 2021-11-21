class ProductsController < ApplicationController

    def create
    end

    def edit
    end

    def index
        @products = Product.all
        i = 0
        @array_four_products = []
        four_products = []
        @products.each do |product|
            four_products.push(product)
            i+=1
            if i == 4
                @array_four_products.push(four_products)
                four_products = []
                i = 0
            end
        end
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

    def destroy_all
        Product.destroy_all
        redirect_to root_path
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to root_path
    end
end
