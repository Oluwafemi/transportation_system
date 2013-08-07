class VehicleVehicleRoute < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :vehicle_route

	validates :vehicle_id, :vehicle_route_id, :presence => true

	def vehicle_type_params
		params.require(:vehicle_vehicle_route).permit(:vehicle_id, :vehicle_route_id)
    end
end
