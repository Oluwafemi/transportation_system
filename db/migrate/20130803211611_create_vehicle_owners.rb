class CreateVehicleOwners < ActiveRecord::Migration
  def change
    create_table :vehicle_owners do |t|

      t.timestamps
    end
  end
end
