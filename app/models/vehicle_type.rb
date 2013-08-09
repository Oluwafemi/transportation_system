class VehicleType < ActiveRecord::Base
	validates :type_name, :description, :presence => true

	has_many :vehicles
	
	def vehicle_type_params 
      params.require(:vehicle_type).permit(:type_name, :description)
    end

    def name
    	type_name
    end
end
