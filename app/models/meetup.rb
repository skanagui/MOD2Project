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
        elsif(chosen_time > 11 && chosen_time < 24)
                case chosen_time  ##  ***  pretty sure there's a shorter way without so many cases
                when 13
                     chosen_time =  1  
                when 14
                     chosen_time =  2  
                when 15
                     chosen_time =  3
                when 16
                     chosen_time =  4  
                when 17
                     chosen_time =  5  
                when 18
                     chosen_time =  6
                when 19
                     chosen_time =  7  
                when 20
                     chosen_time =  8  
                when 21
                     chosen_time =  9
                when 22
                     chosen_time = 10  
                when 23
                     chosen_time = 11                                                                                                    
                end 
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
