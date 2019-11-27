class Courier < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true
    
    has_many :pick_ups
end
