class AddWarehouseNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :warehouse_name, :string
  end
end
