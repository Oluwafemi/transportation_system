class CreateVehicleVehicleRoutes < ActiveRecord::Migration
  def change
    create_table :vehicle_vehicle_routes do |t|
    
      t.references :vehicle, :null => false
      t.references :vehicle_route, :null => false

      t.timestamps
    end

    add_foreign_key(:vehicle_vehicle_routes, :vehicles, dependent: :destroy)
    add_foreign_key(:vehicle_vehicle_routes, :vehicle_routes, dependent: :destroy)
    add_index :vehicle_vehicle_routes, [:vehicle_id, :vehicle_route_id], :unique => true, :name => 'v_v_r_index'
  end
end