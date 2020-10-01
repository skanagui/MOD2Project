class LocationsController < ApplicationController
    def index
        @current_user = User.find_by(id: session[:user])
        @locations = Location.all 
    end
    def show
        @current_user = User.find_by(id: session[:user])
        @location = Location.find(params[:id]) 
    end


    def new
        @current_user = User.find_by(id: session[:user])

        @location = Location.new
    end 
    def create
        @current_user = User.find_by(id: session[:user])

        @location = Location.create(location_params)
        redirect_to locations_path
    end
    

    def edit
        @current_user = User.find_by(id: session[:user])

        @location = Location.find(params[:id])
    end 
    def update 
        @current_user = User.find_by(id: session[:user])

        if @location.valid?
            redirect_to locations_path
         #    redirect_to locations_path(locations)
        else
             flash[:user_errors] = @location.errors.full_messages
             redirect_to location_path(@location)
        end
    end


    def delete
    end 
    


    
    private

    def location_params
        params.require(:location).permit(:name, :address, :description)
    end

end


