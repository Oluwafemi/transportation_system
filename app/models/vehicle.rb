class Vehicle < ActiveRecord::Base
	belongs_to :vehicle_type
	belongs_to :vehicle_owner

	has_many :vehicle_drivers, :through => :vehicle_vehicle_drivers
	has_many :vehicle_routes, :through => :vehicle_vehicle_routes

	validates :plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id, :presence => true

	

end
