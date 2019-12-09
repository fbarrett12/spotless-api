class AddImageToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :image, :string
  end
end
