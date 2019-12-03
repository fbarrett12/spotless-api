class Provider < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true

    has_many :loads, dependent: :destroy
    has_many :users, through: :loads, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews, dependent: :destroy
end
