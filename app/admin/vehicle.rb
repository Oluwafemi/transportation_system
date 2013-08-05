ActiveAdmin.register Vehicle do
	#controller do
	#	vehicle = Vehicle.new(params[:vehicle])
	#	if vehicle.save
	#		redirect_to :action => :index
	#	else
	#		super
	#	end
	#end

	collection_action :autocomplete_vehicle_vehicle_type, :method => :get

    collection_action :autocomplete_vehicle_vehicle_owner, :method => :get

	controller do
        autocomplete :vehicle_type, :type_name
        autocomplete :vehicle_owner, :surname
        #autocomplete :vehicle, :vehicle_owner
    end

	form(:html => { :multipart => true} ) do |f|
		f.inputs do
			f.input :vehicle_type, :as => :autocomplete, :url => autocomplete_vehicle_vehicle_type_admin_vehicles_path
			f.input :vehicle_owner, :as => :autocomplete, :url => autocomplete_vehicle_vehicle_owner_admin_vehicles_path
			f.input :plate_number
			f.input :pin_number
			#f.input :vehicle_drivers
			f.input :current_routes, :as => :select, :multiple => true, :collection => VehicleRoute.all
			f.buttons
		end
	end
end