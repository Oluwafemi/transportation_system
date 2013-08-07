ActiveAdmin.register VehicleVehicleRoute do

	controller do
    
        def permitted_params
            params.permit admin_user: [:vehicle_id, :vehicle_route_id]
        end

    end

    form do |f|
		f.inputs do
			f.input :vehicle, :as => :select, :collection => Vehicle.limit(30)
			f.input :vehicle_route, :as => :select, :collection => VehicleRoute(30)
			
			f.buttons
		end
	end

end
