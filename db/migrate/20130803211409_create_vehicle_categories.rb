class CreateVehicleCategories < ActiveRecord::Migration
  def change
    create_table :vehicle_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
