ActiveAdmin.register VehicleOwner do

	controller do

        def permitted_params
            params.permit vehicle_owner: [:surname, :first_name, :middle_name, :full_name, :gender, :birthday,
                :email, :mobile_one, :mobile_two, :work_phone_one, :work_phone_two, :home_address, :business_address, :state_of_origin]
        end

        #def create
            
         #   vehicle_owner = VehicleOwner.create(params)

          #  if vehicle_owner.valid?
           #     redirect_to :action => :index
           # else
            #    redirect_to :action => :new
            #end
        #end

        #def update
            #
        #end

    end

    index do
    	column :surname
    	column :first_name
    	column :middle_name
    	column :gender
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
    	    row :email
    	    row :mobile_one
    	    row :mobile_two
    	    row :work_phone_one
    	    row :work_phone_two
    	    row :home_address
    	    row :business_address
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
		    f.input :email
			f.input :mobile_one
			f.input :mobile_two
			f.input :work_phone_one
			f.input :work_phone_two
			f.input :home_address
			f.input :business_address
			f.input :state_of_origin, :as => :select, :collection => ApplicationController::STATES
			
			f.buttons
		end
	end

end

