class VehicleDriver < ActiveRecord::Base
	has_many :vehicles, :dependent => :nullify
	validates :surname, :first_name, :middle_name, :gender, :birthday, :driver_license_registration, :mobile_one, :home_address, :state_of_origin, :presence => true
	#
end
