class Meetup < ApplicationRecord
    belongs_to :user
    belongs_to :location
    

    validates :time, presence: true
    validates :purpose, presence: true 

    
end
