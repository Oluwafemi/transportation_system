ActiveAdmin.register VehicleRoute do

	controller do
    
        def permitted_params
            params.permit vehicle_route: [:route_number, :first_end, :second_end]
        end

    end

end
