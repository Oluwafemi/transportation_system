class VehicleVehicleDriver < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :vehicle_driver

	validates :vehicle_id, :vehicle_driver_id, :presence => true
end
