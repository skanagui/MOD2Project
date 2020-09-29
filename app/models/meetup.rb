class Meetup < ApplicationRecord
    belongs_to :user
    belongs_to :location
    

    validates :time, presence: true
    validates :purpose, presence: true 


    def purpose_of_meeting
        Meetup.all.map{ |m| m.location.name }
    end

    def user_wants_to_enter_own_location

    end 




end
