class AddIndexesToVehicleRoutes < ActiveRecord::Migration
  def change
  end

  add_index :vehicle_routes, [:full_route_name], :unique => true, :name => 'fullroutenameindex'
  add_index :vehicle_routes, [:reverse_route_name], :unique => true, :name => 'reverseroutenameindex'
end
