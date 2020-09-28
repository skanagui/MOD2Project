class User < ApplicationRecord
    has_many :meetups
    has_many :locations, through: :meetups
end
