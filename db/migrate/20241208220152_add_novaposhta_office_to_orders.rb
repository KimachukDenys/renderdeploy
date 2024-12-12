class AddNovaposhtaOfficeToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :novaposhta_office, :string
    add_column :orders, :novaposhta_office_ref, :string
  end
end
