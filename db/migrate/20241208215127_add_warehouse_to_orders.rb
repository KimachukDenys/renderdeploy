class AddWarehouseToOrders < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :warehouse, null: false, foreign_key: true
  end
end
