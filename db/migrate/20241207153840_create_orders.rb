class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.decimal :total, precision: 10, scale: 2
      t.string :delivery_method
      t.string :payment_method

      t.timestamps
    end
  end
end
