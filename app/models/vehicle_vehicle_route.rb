class VehicleVehicleRoute < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :vehicle_route

	validates :vehicle_id, :vehicle_route_id, :presence => true
end
