module Api 
    class ProductsController < ApplicationController

        def index 
            @products = Product.all 
            if !@products.blank?
                render json: @products, status: :ok
            else
                render json: @products, status: :bad_request
            end
        end

        def create 
            @product = Product.create(product_params)
            if @product.save
                render json: @product, status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def update 
            product = set_product
            if product.update(product_params)
                render json: product, status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def destroy 
            product = set_product
            if product.destroy
                render json: "Deleted...", status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def show 
            product = set_product
            render json: product
        end

        private 

        def set_product
            @product = Product.find(params[:id])
        end

        def product_params 
            params.permit(:name, :description, :quantity, :price)
        end  
    end
end