module Api
    class TableunitsController < ApplicationController
        def index
            @restaurant = Restaurant.find(params[:restaurant_id])
            respond_with @restaurant.tableunits
        end
        def show
            @tableunit = Tableunit.find_by_id(params[:id])
            if @tableunit == nil
                return head :not_found
            end
            respond_with @tableunit
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
            @tableunit = @restaurant.tableunits.create(tableunit_params)
            if @tableunit.save
                head :created ,location: restaurant_tableunit_path(@restaurant,@tableunit)
            else
                head :bad_request
            end
        end
        def update
            @tableunit = Tableunit.find_by_id(params[:id])
            if @tableunit == nil
                head :not_found
            else
                if @tableunit.update(tableunit_params)
                    head :no_content
                else
                    head :bad_request
                end
            end
        end

        def destroy
            @tableunit = Tableunit.find_by_id(params[:id])
            if @tableunit == nil
                head :not_found
            else
                @tableunit.destroy
                head :no_content
            end
        end
        private
        def tableunit_params
            params.require(:tableunit).permit(:status)
        end
    end
end
