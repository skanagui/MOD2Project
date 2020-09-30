class Location < ApplicationRecord
    has_many :meetups
    has_many :users, through: :meetups

    def self.search(search)
        if search
            location = Location.find_by(name: search)
            if location
                self.where(location_id: location)
            else
                Location.all
            end
        else
          Location.all
        end
    end    

end
