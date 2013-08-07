class VehicleRoute < ActiveRecord::Base

	#has_many :vehicles, :through => :vehicle_vehicle_routes

	validates :route_number, :first_end, :second_end, :presence => true

	def vehicle_type_params 
      params.require(:vehicle_route).permit(:route_number, :first_end, :second_end)
    end

end
