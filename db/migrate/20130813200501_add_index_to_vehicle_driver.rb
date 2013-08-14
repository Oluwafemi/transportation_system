class AddIndexToVehicleDriver < ActiveRecord::Migration
  def change
  end
  add_index :vehicle_drivers, [:full_name], :unique => true, :name => 'driversfullnameindex'
end
