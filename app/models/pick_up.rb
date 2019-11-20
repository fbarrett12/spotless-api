class PickUp < ApplicationRecord
  belongs_to :load
  belongs_to :courier
end
