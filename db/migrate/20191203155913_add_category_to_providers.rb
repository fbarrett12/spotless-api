class AddCategoryToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :category, :string
  end
end
