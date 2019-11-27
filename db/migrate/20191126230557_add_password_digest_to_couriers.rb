class AddPasswordDigestToCouriers < ActiveRecord::Migration[6.0]
  def change
    add_column :couriers, :password_digest, :string
  end
end
