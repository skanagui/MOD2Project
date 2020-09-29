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
        @meetup = Meetup.create(meetup_params)
                redirect_to meetups_path


        # if @meetup.valid?
        #    redirect_to meetup_path(meetups)
        # else
        #     flash[:user_errors] = @meetup.errors.full_messages
        #     redirect_to new_meetup_path
        # end

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


    def time_to_ampm(chosen_time)
        if   (chosen_time >  0 && chosen_time < 12)
              return chosen_time.to_s + "am"
        elsif(chosen_time > 12 && chosen_time < 25)
              return chosen_time.to_s + "pm"
        end 
    end 
    
    
    private
    
    def meetup_params
        params.require(:meetup).permit(:purpose, :time, :user_id, :location_id )
    end 

end
