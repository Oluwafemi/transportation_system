class Vehicle < ActiveRecord::Base
	belongs_to :vehicle_type
	belongs_to :vehicle_owner

	has_many :vehicle_drivers, :through => :vehicle_vehicle_drivers
	has_many :vehicle_routes, :through => :vehicle_vehicle_routes

	has_many :vehicle_vehicle_drivers
	accepts_nested_attributes_for :vehicle_vehicle_drivers

	has_many :vehicle_vehicle_routes
	accepts_nested_attributes_for :vehicle_vehicle_routes

	validates :plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id, :presence => true	

	def vehicle_params 
      params.require(:vehicle).permit(:plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id)
    end

	def name
    	"#{vehicle.plate_number} - #{vehicle.pin_number}" 
    end

end
