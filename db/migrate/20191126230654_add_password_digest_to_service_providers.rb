class AddPasswordDigestToServiceProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :password_digest, :string
  end
end
