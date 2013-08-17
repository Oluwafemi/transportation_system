ActiveAdmin.register VehicleDriver do

    actions :all, :except => [:destroy]

	controller do

        def permitted_params
            params.permit vehicle_driver: [:surname, :first_name, :middle_name, :full_name, :gender, :birthday,
                :driver_license_registration, :email, :mobile_one, :mobile_two, :home_address, :state_of_origin]
        end

        def create
            params[:vehicle_driver][:full_name] = "#{params[:vehicle_driver][:surname]} #{params[:vehicle_driver][:first_name]} #{params[:vehicle_driver][:middle_name]}"
            super
        end

        def update
            params[:vehicle_driver][:full_name] = "#{params[:vehicle_driver][:surname]} #{params[:vehicle_driver][:first_name]} #{params[:vehicle_driver][:middle_name]}"
            super
        end

    end


    index do
    	column :surname
    	column :first_name
    	column :middle_name
    	column :gender
    	column :driver_license_registration
    	column :state_of_origin
        column :created_at
        column :updated_at

    	default_actions
    end

    filter :surname
    filter :first_name
    filter :middle_name
    filter :gender
    filter :state_of_origin
    filter :created_at
    filter :updated_at  

    show do
    	attributes_table do
    		row :surname
    	    row :first_name
    	    row :middle_name
    	    row :gender
    	    row :birthday
    	    row :driver_license_registration
    	    row :email
    	    row :mobile_one
    	    row :mobile_two
    	    row :home_address
    	    row :state_of_origin
            row :created_at
            row :updated_at
            row 'Vehicles' do |vehicle|
                vehicle_driver.vehicles.map(&:descriptive_name).join("<br />").html_safe
            end
    	end
    	active_admin_comments
    end

    form do |f|
		f.inputs do
			f.input :surname
			f.input :first_name
			f.input :middle_name
			f.input :gender, :as => :select, :collection => ApplicationController::GENDER
			f.input :birthday, :as => :date_select, :start_year => 1900, :end_year => Time.now.year - 5
			f.input :driver_license_registration
			f.input :email
			f.input :mobile_one
			f.input :mobile_two
			f.input :home_address
			f.input :state_of_origin, :as => :select, :collection => ApplicationController::STATES
			
			f.buttons
		end
	end

end