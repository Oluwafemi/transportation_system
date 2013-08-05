class CreateVehicleVehicleDrivers < ActiveRecord::Migration
  def change
    create_table :vehicle_vehicle_drivers do |t|

      t.references :vehicle, :null => false
      t.references :vehicle_driver, :null => false

      t.timestamps
    end

    add_foreign_key(:vehicle_vehicle_drivers, :vehicles, dependent: :destroy)
    add_foreign_key(:vehicle_vehicle_drivers, :vehicle_drivers, dependent: :destroy)
    add_index :vehicle_vehicle_drivers, [:vehicle_id, :vehicle_driver_id], :unique => true, :name => 'v_v_d_index'
  end
end