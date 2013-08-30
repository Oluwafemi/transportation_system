ActiveAdmin.register Vehicle do

    actions :all, :except => [:destroy]

    form :partial => 'form'
    
	controller do
    
        def permitted_params
        	params.permit vehicle: [:plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id, 
                :vehicle_route_ids => [], :vehicle_driver_ids => []]
        end

        def vehicle_driver_suggestions
            @suggestions = VehicleDriver.where('full_name LIKE ?', "#{params[:term]}%")
            render json: @suggestions
        end

        #def edit
            #@vehicle_type_suggetions = []
            #all = VehicleType.all
            #all.map { |type| @vehicle_type_suggetions << type.type_name }
            
            #@vehicle_owner_suggetions = []
            #all = VehicleOwner.all
            #all.map { |owner| @vehicle_owner_suggetions << owner.full_name }

            #super
        #end

        def create
            params[:vehicle][:vehicle_type_id] = VehicleType.type_id(params[:vehicle][:vehicle_type_id])
            params[:vehicle][:vehicle_owner_id] = VehicleOwner.owner_id(params[:vehicle][:vehicle_owner_id])

            vehicle = Vehicle.create(:vehicle_type_id => params[:vehicle_type_id], :vehicle_owner_id => params[:vehicle_owner_id],
                :plate_number => params[:vehicle][:plate_number], :pin_number => params[:vehicle][:pin_number])

            if vehicle.valid?
                vehicle_route_ids = params[:vehicle][:vehicle_route_ids] - ['']
                vehicle.vehicle_route_ids = vehicle_route_ids

                vehicle_driver_ids = params[:vehicle][:vehicle_driver_ids] - ['']
                vehicle.vehicle_driver_ids = vehicle_driver_ids

                vehicle.save

                redirect_to :action => :index
            else
                super
            end
        end

    end

    index do
        column :vehicle_type
        column :vehicle_owner
        column :plate_number
        column :pin_number
        column :created_at
        column :updated_at

        default_actions
    end

    filter :vehicle_type
    filter :vehicle_owner
    filter :plate_number
    filter :pin_number
    filter :vehicle_drivers
    filter :vehicle_routes
    filter :created_at
    filter :updated_at

    show do
        attributes_table do
            row :vehicle_type
            row :vehicle_owner
            row :plate_number
            row :pin_number
            row 'Vehicle Routes' do |route|
                vehicle.vehicle_routes.map(&:name).join("<br />").html_safe
            end
            row 'Vehicle Drivers' do |driver|
                vehicle.vehicle_drivers.map(&:name).join("<br />").html_safe
            end
        end
        active_admin_comments
    end
  
end
        