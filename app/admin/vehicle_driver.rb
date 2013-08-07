ActiveAdmin.register VehicleDriver do

	config.per_page = 30

    index do
    	column :surname
    	column :first_name
    	column :middle_name
    	column :gender
    	column :driver_license_registration
    	column :state_of_origin

    	default_actions
    end

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
    	end
    	active_admin_comments
    end

    filter :surname
    filter :first_name
    filter :middle_name
    filter :gender
    filter :state_of_origin    

	form do |f|
		f.inputs do
			f.input :surname
			f.input :first_name
			f.input :middle_name
			f.input :gender, :as => :select, :collection => ['MALE', 'FEMALE']
			f.input :birthday, :as => :date, :start_year => 1900, :end_year => Time.now.year - 5
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