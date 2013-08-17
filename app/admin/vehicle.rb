ActiveAdmin.register Vehicle do

    actions :all, :except => [:destroy]
    
	controller do
    
        def permitted_params
        	params.permit vehicle: [:plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id, 
                :vehicle_route_ids => [], :vehicle_driver_ids => []]
        end

        def create
            vehicle = Vehicle.create(:vehicle_type_id => params[:vehicle][:vehicle_type_id], :vehicle_owner_id => params[:vehicle][:vehicle_owner_id],
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

    form do |f|  
		f.inputs "Vehicle Details" do 
			f.input :vehicle_type, :as => :select, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click'}  #as: :chosen, create_option: true
            f.input :vehicle_owner, :input_html => { :class => "chosen-input" }, :collection => VehicleOwner.all
            f.input :plate_number
			f.input :pin_number
        end 

        f.inputs "Vehicle Routes" do  
            f.input :vehicle_routes, :as => :select, :blank => false, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click',
            :multiple => true }, :collection => VehicleRoute.all 
        end 

        f.inputs "Vehicle Drivers" do  
            f.input :vehicle_drivers, :as => :select, :blank => false, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click',
            :multiple => true }, :collection => VehicleDriver.all
        end 

        f.actions
    end
  
end

