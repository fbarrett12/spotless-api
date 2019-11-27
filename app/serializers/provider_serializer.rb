class ProviderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address
  has_many :loads
  has_many :reviews
end
