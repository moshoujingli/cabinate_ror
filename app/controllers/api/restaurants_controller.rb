module Api
    class RestaurantsController < ApplicationController
        def index
            @restaurants = Restaurant.all
            respond_with @restaurants
        end
        def show
            @restaurant = Restaurant.find_by_id(params[:id])
            if @restaurant == nil
                @restaurant = []
            end
            respond_with @restaurant
        end

        def new
        end
        def edit
        end

        def create
            @restaurant = Restaurant.new(filted_restaurant_param)
            if @restaurant.save
                head :created ,location: restaurant_path(@restaurant)
            else
                head :bad_request
            end
        end
        def update
            @restaurant = Restaurant.find_by_id(params[:id])
            if @restaurant == nil
                head :not_found
            else
                if @restaurant.update(filted_restaurant_param)
                    head :no_content
                else
                    head :bad_request
                end
            end
        end

        def destroy
            @restaurant = Restaurant.find_by_id(params[:id])
            if @restaurant == nil
                head :not_found
            else
                @restaurant.destroy
                head :no_content
            end
        end
        private
        def filted_restaurant_param
            params.require(:restaurant).permit(:name, :status)
        end
    end
end
