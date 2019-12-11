class AddProivderNameToLoads < ActiveRecord::Migration[6.0]
  def change
    add_column :loads, :provider_name, :string
  end
end
