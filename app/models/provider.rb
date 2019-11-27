class Provider < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true

    has_many :loads
    has_many :users, through: :loads
    has_many :reviews
    has_many :users, through: :reviews
end
