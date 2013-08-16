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
    	"#{plate_number} - #{pin_number}" 
    end

end


# goals 
# -> we want to implement TRANSACTIONAL MESSAGING
# -> choosing an SMS gateway provider for transactional messaging
# -> choosing amongst connection options (SOAP, XML, FTP, HTTPS) for interfacing with the SMS gateway
# -> Designing an infrastructure with ActiveRecord for storing SMS messages
# ! scaling your app to send messages in bulk
# -> receiving, parsing, and responding to transactional messages
