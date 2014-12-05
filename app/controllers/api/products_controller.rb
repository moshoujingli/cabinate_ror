module Api
    class ProductsController < ApplicationController
        def index
            @restaurant = Restaurant.find(params[:restaurant_id])
            respond_with @restaurant.products
        end
        def show
            @product = Product.find_by_id(params[:id])
            if @product == nil
                return head :not_found
            end
            respond_with @product
        end

        def new
        end
        def edit
        end

        def create
            @restaurant = Restaurant.find_by_id(params[:restaurant_id])
            if @restaurant ==nil
                return head :not_found
            end
            @product = @restaurant.products.create(product_params)
            if @product.save
                head :created ,location: restaurant_product_path(@restaurant,@product)
            else
                head :bad_request
            end
        end
        def update
            @product = Product.find_by_id(params[:id])
            if @product == nil
                head :not_found
            else
                if @product.update(product_params)
                    head :no_content
                else
                    head :bad_request
                end
            end
        end

        def destroy
            @product = Product.find_by_id(params[:id])
            if @product == nil
                head :not_found
            else
                @product.destroy
                head :no_content
            end
        end
        private
        def product_params
            params.require(:product).permit(:status,:name,:desc,:price,:category)
        end
    end
end
