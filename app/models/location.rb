class Location < ApplicationRecord
    has_many :meetups
    has_many :users, through: :meetups
end
