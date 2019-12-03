class AddLatitudeToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :latitude, :string
  end
end
