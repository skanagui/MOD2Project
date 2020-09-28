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
        meetup = Meetup.create

        if meetup.vaid?
           redirect_to meetup_path(meetup)
        else
            #flash
            redirect_to new_meetup_path
        end

    end
    
    def edit
    end 
    def update 
    end

    def delete
        
    end 

end
