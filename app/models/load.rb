class Load < ApplicationRecord
  belongs_to :user
  belongs_to :provider
  has_many :pick_ups
end
