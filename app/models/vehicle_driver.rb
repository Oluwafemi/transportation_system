class VehicleDriver < ActiveRecord::Base
	
	has_many :vehicles, :through => :vehicle_vehicle_drivers
    has_many :vehicle_vehicle_drivers
	accepts_nested_attributes_for :vehicle_vehicle_drivers

	validates :surname, :first_name, :middle_name, :gender, :birthday, :driver_license_registration, :mobile_one, :home_address, :state_of_origin, :presence => true
    #validates_format_of :email, :with  => ApplicationController::EMAIL_REGEXP, :allow_blank => true

    def vehicle_driver_params 
      params.require(:vehicle_driver).permit(:surname, :first_name, :middle_name, :full_name, :gender, :birthday,
      	:driver_license_registration, :email, :mobile_one, :mobile_two, :home_address, :state_of_origin)
    end

    def name
        full_name
    end

    def self.available_vehicle_drivers
        all.map { |driver| driver.name }
    end

    def self.driver_id(full_name)
        id = where(:full_name => full_name)[0].id
    end

end
