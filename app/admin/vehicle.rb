ActiveAdmin.register Vehicle do

    actions :all, :except => [:destroy]
    
	#config.per_page = 30

    show :title => :current_title do
        attributes_table do
            row :vehicle_type
            row :plate_number
            row :pin_number
            row :vehicle_owner
            row :created_at
            row :updated_at
        end

        active_admin_comments
    end

	controller do
    
        def permitted_params
        	params.permit vehicle: [:plate_number, :pin_number, :vehicle_type_id, :vehicle_owner_id]
        end

        def create
            vehicle_params = params[:vehicle]
            vehicle = Vehicle.create!(:vehicle_type_id => vehicle_params[:vehicle_type_id], :vehicle_owner_id => vehicle_params[:vehicle_owner_id],
                :plate_number => vehicle_params[:plate_number], :pin_number => vehicle_params[:pin_number])            
            if vehicle.valid?
                v_v_routes = vehicle_params[:vehicle_route_ids]
                v_v_routes.each do |id|
                    if id != ''
                        VehicleVehicleRoute.create!(:vehicle_id => vehicle.id, :vehicle_route_id => id.to_i)
                    end
                end

                v_v_drivers = vehicle_params[:vehicle_driver_ids]
                v_v_drivers.each do |id|
                    if id != ''
                        VehicleVehicleDriver.create!(:vehicle_id => vehicle.id, :vehicle_driver_id => id.to_i)
                    end
                end

                redirect_to :action => :index
            else
                redirect_to :action => :new
            end

        end

    end

	form do |f|  
		f.inputs "Vehicle Details" do 
			f.input :vehicle_type, :as => :select, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click'}  #as: :chosen, create_option: true
            #f.input :vehicle_owner:, :input_html => { :class => "chosen-input" }   #as: :chosen, create_option: true
            f.input :vehicle_owner, :input_html => { :class => "chosen-input" }, :collection => VehicleOwner.all #available_vehicle_owners
            f.input :plate_number
			f.input :pin_number
        end 

        f.inputs "Vehicle Routes" do  
            f.input :vehicle_routes, :as => :select, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click',
            :multiple => true }, :collection => VehicleRoute.all 
        end 

        f.inputs "Vehicle Drivers" do  
            f.input :vehicle_drivers, :as => :select, :input_html => { :class => 'chzn-select', :width => 'auto', "data-placeholder" => 'Click',
            :multiple => true }, :collection => VehicleDriver.all #available_vehicle_drivers
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