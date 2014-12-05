module Site
    class RestaurantsController < ApplicationController

        def index
            @restaurants = Restaurant.all
            @restaurants
        end
        def show
            @restaurant = Restaurant.find_by_id(params[:id])
            if @restaurant == nil
                @restaurant = {}
            end
            @restaurant
        end

        def new
            @restaurant = Restaurant.new
        end
        def edit
            @restaurant = Restaurant.find(params[:id])
            @restaurant
        end

        def create
            @restaurant = Restaurant.new(filted_restaurant_param)
            if @restaurant.save
                redirect_to @restaurant
            else
                render 'new'
            end
        end
        def update
            @restaurant = Restaurant.find_by_id(params[:id])
            if @restaurant == nil
                render 'new'
            else
                if @restaurant.update(filted_restaurant_param)
                    redirect_to @restaurant
                else
                    render 'edit'
                end
            end
        end

        def destroy
            @restaurant = Restaurant.find(params[:id])
            @restaurant.destroy
            redirect_to restaurants_path
        end
        private
        def filted_restaurant_param
            params.require(:restaurant).permit(:name, :status)
        end
    end
end
