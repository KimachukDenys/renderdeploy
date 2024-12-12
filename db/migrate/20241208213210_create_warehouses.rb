class CreateWarehouses < ActiveRecord::Migration[7.0]
  def change
    create_table :warehouses do |t|
      t.string :ref
      t.string :city_description
      t.string :description

      t.timestamps
    end
  end
end
