module Site
    class TableunitsController < ApplicationController
        def create
            @restaurant = Restaurant.find(params[:restaurant_id])
            @tableunit = @restaurant.tableunits.create(tableunit_params)
            redirect_to restaurant_path(@restaurant)
        end
        private
        def tableunit_params
            params.require(:tableunit).permit(:status)
        end
    end
end
