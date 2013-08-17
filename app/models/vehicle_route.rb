class VehicleRoute < ActiveRecord::Base

	has_many :vehicles, :through => :vehicle_vehicle_routes
    has_many :vehicle_vehicle_routes
	accepts_nested_attributes_for :vehicle_vehicle_routes

	validates :route_number, :first_end, :second_end, :full_route_name, :reverse_route_name, :presence => true

	def vehicle_route_params 
      params.require(:vehicle_route).permit(:route_number, :first_end, :second_end, :full_route_name, :reverse_route_name)
    end

    def name
    	full_route_name
    end

end
