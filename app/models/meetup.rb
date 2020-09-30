class Meetup < ApplicationRecord
    belongs_to :user
    belongs_to :location
    

    validates :time, presence: true, numericality: { greater_than: -1, less_than: 24 }
    validates :purpose, presence: true 


    def time_to_ampm(chosen_time)
        if   (chosen_time >  -1 && chosen_time < 12)
              if    (chosen_time == 0)
                     chosen_time = 12
              end   
              return chosen_time.to_s + "am"
        elsif(chosen_time == 12 || chosen_time > 11  &&  chosen_time < 24)
               if    (chosen_time == 12)
                      chosen_time =  12
               return chosen_time.to_s + "pm"
               end
                      chosen_time = (chosen_time - 12)
               return chosen_time.to_s + "pm"
        end 
    end 




##  XX-    
    # def new_location
    #     @location = Location.create(LocationsController.new_meetup_location_params)
    # end




    ##  Might Not Use

    def purpose_of_meeting
        Meetup.all.map{ |m| m.location.name }
    end

    def user_wants_to_enter_own_location

    end 



end
