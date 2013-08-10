ActiveAdmin.register Vehicle do
	#config.per_page = 30

    #controller do
	#	vehicle = Vehicle.new(params[:vehicle])
	#	if vehicle.save
	#		redirect_to :action => :index
	#	else
	#		super
	#	end
	#end

	controller do
    
        def permitted_params
        	params.permit vehicle: [:plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id]
        end
    end

	form do |f|  
		f.inputs "Vehicle Details" do 
			f.input :vehicle_type, :as => :select, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click'}  #as: :chosen, create_option: true
            #f.input :vehicle_owner:, :input_html => { :class => "chosen-input" }   #as: :chosen, create_option: true
            f.input :vehicle_owner, :input_html => { :class => "chosen-input" }, :collection => VehicleOwner.available_vehicle_owners
            f.input :plate_number
			f.input :pin_number
        end 

        f.inputs "Vehicle Routes" do  
            f.input :vehicle_routes, :as => :select, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click',
            :multiple => true }, :collection => VehicleRoute.all 
        end 

        f.inputs "Vehicle Drivers" do  
            f.input :vehicle_drivers, :as => :select, :input_html => { :class => "chosen-input", :multiple => true } , 
            :collection => VehicleDriver.available_vehicle_drivers
        end 

        f.actions
    end
  
end

#$(document).ready(function(){
#   $(".chosen-input").chosen();
#});
#form(:html => { :multipart => true} ) do |f|
#f.input :description, :input_html => { :rows => 10, :cols => 20 }  
#f.has_many :vehicle_vehicle_routes do |v_route|
#v_route.inputs "Routes" do
#if !app_f.object.nil?
# show the destroy checkbox only if it is an existing appointment
# else, there's already dynamic JS to add / remove new appointments
#app_f.input :_destroy, :as => :boolean, :label => "Destroy?"
#end
#v_route.input :vehicle_route, :label => :route
#f.input :vehicle_type, :as => :autocomplete, :url => autocomplete_vehicle_vehicle_type_admin_vehicles

#collection_action :autocomplete_vehicle_vehicle_type, :method => :get
#collection_action :autocomplete_vehicle_vehicle_owner, :method => :get
#controller do
#autocomplete :vehicle_type, :type_name
#autocomplete :vehicle_owner, :full_name