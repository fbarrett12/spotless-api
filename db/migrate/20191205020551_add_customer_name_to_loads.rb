class AddCustomerNameToLoads < ActiveRecord::Migration[6.0]
  def change
    add_column :loads, :customer_name, :string
  end
end
