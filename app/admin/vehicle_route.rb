ActiveAdmin.register VehicleRoute do

	actions :all, :except => [:destroy]

	index do
    	column :route_number
    	column :full_route_name
    	column :created_at
    	column :updated_at

    	default_actions
    end

    show do
		attributes_table do
			row :route_number
            row :full_route_name
            row :reverse_route_name
            row :created_at
            row :updated_at
        end

        active_admin_comments
    end

    controller do
    
        def permitted_params
            params.permit vehicle_route: [:route_number, :first_end, :second_end, :full_route_name, :reverse_route_name]
        end

        def create
            params[:vehicle_route][:full_route_name] = "#{params[:vehicle_route][:first_end]} / #{params[:vehicle_route][:second_end]}"
            params[:vehicle_route][:reverse_route_name] = "#{params[:vehicle_route][:second_end]} / #{params[:vehicle_route][:first_end]}"
            super
        end

        def update
            params[:vehicle_route][:full_route_name] = "#{params[:vehicle_route][:first_end]} / #{params[:vehicle_route][:second_end]}"
            params[:vehicle_route][:reverse_route_name] = "#{params[:vehicle_route][:second_end]} / #{params[:vehicle_route][:first_end]}"
            super
        end

    end

    form do |f|
        f.inputs do
            f.input :route_number
            f.input :first_end
            f.input :second_end
            
            f.buttons
        end
    end

end
