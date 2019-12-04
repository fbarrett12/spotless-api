class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address
  has_many :loads
end
