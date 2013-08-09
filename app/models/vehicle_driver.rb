class VehicleDriver < ActiveRecord::Base
	
	has_many :vehicles, :through => :vehicle_vehicle_drivers
    has_many :vehicle_vehicle_drivers
	accepts_nested_attributes_for :vehicle_vehicle_drivers

	validates :surname, :first_name, :middle_name, :gender, :birthday, :driver_license_registration, :mobile_one, :home_address, :state_of_origin, :presence => true

    def vehicle_driver_params 
      params.require(:vehicle_driver).permit(:surname, :first_name, :middle_name, :full_name, :gender, :birthday,
      	:driver_license_registration, :email, :mobile_one, :mobile_two, :home_address, :state_of_origin)
    end

    def name
        "#{surname} #{first_name} #{middle_name}"
    end

    def self.available_vehicle_drivers
        all.map { |driver| owner.name }
    end

end
