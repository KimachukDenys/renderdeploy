class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :ref
      t.string :area
      t.string :area_description

      t.timestamps
    end
  end
end
