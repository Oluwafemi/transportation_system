ActiveAdmin.register VehicleType do

	controller do
    
        def permitted_params
        	params.permit vehicle_type: [:type_name, :description]
        end
    end

end
