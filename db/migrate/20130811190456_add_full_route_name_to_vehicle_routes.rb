class AddFullRouteNameToVehicleRoutes < ActiveRecord::Migration
  def change
  	add_column :vehicle_routes, :full_route_name, :string
  	add_column :vehicle_routes, :reverse_route_name, :string
  end
end
