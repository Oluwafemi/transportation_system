class Vehicle < ActiveRecord::Base
	belongs_to :vehicle_type
	belongs_to :vehicle_owner

	validates :plate_number, :pin_number, :presence => true
end
