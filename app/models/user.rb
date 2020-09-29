class User < ApplicationRecord
    has_many :meetups
    has_many :locations, through: :meetups


    validates :name, uniqueness: true 
    #validates_confirmation_of :password

    has_secure_password
   
    
end
