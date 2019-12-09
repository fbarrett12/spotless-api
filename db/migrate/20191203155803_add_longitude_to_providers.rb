class AddLongitudeToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :longitude, :string
  end
end
