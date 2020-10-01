class User < ApplicationRecord
    has_many :meetups
    has_many :locations, through: :meetups
    has_many :blogs



    validates :name, uniqueness: true, presence: true 
    #validates_confirmation_of :password

    has_secure_password
   
    
end
