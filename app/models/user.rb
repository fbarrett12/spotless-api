class User < ApplicationRecord
    has_secure_password 
    validates :name, uniqueness: true
    
    has_many :loads
    has_many :providers, through: :loads
    has_many :reviews
    has_many :providers, through: :reviews

    
end
