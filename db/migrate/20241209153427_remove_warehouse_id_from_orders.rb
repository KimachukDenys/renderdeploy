class RemoveWarehouseIdFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :warehouse_id, :integer
  end
end
