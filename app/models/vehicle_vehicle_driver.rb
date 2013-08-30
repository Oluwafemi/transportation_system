class VehicleVehicleDriver < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :vehicle_driver

	validates :vehicle_id, :vehicle_driver_id, :presence => true

	def vehicle_vehicle_driver_params 
      params.require(:vehicle_vehicle_driver).permit(:vehicle_id, :vehicle_driver_id)
    end
    
end
