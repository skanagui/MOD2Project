class LocationsController < ApplicationController
    def index
        @locations = Location.all 
    end 
    def show
        @location = Location.find(params[:id])
    end

    def new
        @location = Location.new
    end 
    def create
        @location = Location.create(location_params)
        redirect_to locations_path
    end
    
    def edit
        @location = Location.find(params[:id])
    end 
    def update 
    end

    def delete
    end 
    

##  XX-
    # def self.new_meetup_location_params
    #     self.get_params.require(:location).permit(:name, :address, :description)
    # end 

    
    private

    def location_params
        params.require(:location).permit(:name, :address, :description)
    end 
end


