class MeetupsController < ApplicationController

    def index
        @current_user = User.find_by(id: session[:user])
        @meetups = Meetup.all
    end 
    def show
        @current_user = User.find_by(id: session[:user])
        @meetup = Meetup.find(params[:id])

    end


    def new
        @current_user = User.find_by(id: session[:user])
        @meetup = Meetup.new 
    end 
    def create
        @current_user = User.find_by(id: session[:user])

        meetup = Meetup.create(meetup_params)
                  # redirect_to meetups_path


        if meetup.valid?
           redirect_to meetups_path
        else
            flash[:user_errors] = meetup.errors.full_messages
            redirect_to new_meetup_path
        end

    end
    

    def edit
        @current_user = User.find_by(id: session[:user])

        @meetup = Meetup.find(params[:id])
    end 
    def update
        @meetup = Meetup.find(params[:id])

        if @meetup.valid?
            redirect_to meetups_path
         #    redirect_to meetups_path(meetups)
        else
             flash[:user_errors] = @meetup.errors.full_messages
             redirect_to meetup_path(@meetup)
        end

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
