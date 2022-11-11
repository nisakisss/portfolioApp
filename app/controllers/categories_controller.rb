module Api 
    class CategoriesController < ApplicationController
        def index 
            @categories = Category.all
            if !@categories.blank?
                render json: @categories, status: :ok
            else
                render json: @categories, status: :bad_request
            end
        end

        def create 
            @category = Category.create(category_params)
            if @category.save
                render json: @category, status: :ok
            else
                render json: "Error", status: :bad_request
            end

        end

        def update 
            category = set_category
            if category.update(category_params)
                render json: category, status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def destroy
            category = set_category
            if category.destroy
                render json: "Deleted...", status: :ok
            else
                render json: "Error", status: :bad_request
            end
        end

        def show 
            category = set_category
            if !category.blank?
                render json: category, status: :ok
            else
                render json: category, status: :bad_request
            end
        end

        private 

        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.permit(:name)
        end

    end
end