class ProviderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :longitude, :latitude, :category, :borough, :image
  has_many :loads
  has_many :reviews
end
