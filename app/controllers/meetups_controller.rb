class MeetupsController < ApplicationController

    def index
        @meetups = Meetup.all
    end 
    def show
        @meetup = Meetup.find(params[:id])
    end


    def new
        @meetup = Meetup.new 
    end 
    def create
        # @locations = Location.all
        # @location = Location.find(params[:id])


        meetup = Meetup.create(meetup_params)
                  # redirect_to meetups_path


        if meetup.valid?
           redirect_to meetups_path
        #    redirect_to meetups_path(meetups)
        else
            flash[:user_errors] = meetup.errors.full_messages
            redirect_to new_meetup_path
        end

    end
    

    def edit
        @meetup = Meetup.find(params[:id])
    end 
    def update 
    end


    def destroy
        @meetup = Meetup.find(params[:id])
        @meetup.destroy
        
        redirect_to meetups_path
    end 



    
    
    private
    
    def meetup_params
        params.require(:meetup).permit(:purpose, :time, :user_id, :location_id)
    end 

end
