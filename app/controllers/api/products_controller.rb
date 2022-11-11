module Api 
    class ProductsController < ApplicationController

        before_action :set_product, only: %i[update show destroy]

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
            if @product.update(product_params)
                render json: @product, status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def destroy 
            if product.destroy
                render json: "Deleted...", status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def show 
            image = rails_blob_url(@product.product_image)
            render json: {"image": image, "product": @product}
        end

        private 

        def set_product
            @product = Product.find(params[:id])
        end

        def product_params 
            params.permit(:name, :description, :quantity, :price, :product_image)
        end  
    end
end