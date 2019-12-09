class AddBoroughToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :borough, :string
  end
end
