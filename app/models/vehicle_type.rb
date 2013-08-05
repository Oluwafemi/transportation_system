class VehicleType < ActiveRecord::Base
	validates :type_name, :description, :presence => true
	
	def vehicle_type_params 
      params.require(:vehicle_type).permit(:type_name, :description)
    end
end
