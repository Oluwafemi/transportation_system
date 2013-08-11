ActiveAdmin.register VehicleType do

	actions :all, :except => [:destroy]

	index do
    	column :type_name
    	column :description
    	column :created_at
    	column :updated_at

    	default_actions
    end

    show do
		attributes_table do
			row :type_name
            row :description
            row :created_at
            row :updated_at
        end

        active_admin_comments
    end

	controller do
    
        def permitted_params
        	params.permit vehicle_type: [:type_name, :description]
        end
    end

end
