class AddFullNameToVehicleDriver < ActiveRecord::Migration
  def change
    add_column :vehicle_drivers, :full_name, :string
  end
end
