class VehicleOwner < ActiveRecord::Base

	validates :surname, :first_name, :gender, :mobile_one, :home_address, :business_address, :state_of_origin, :presence => true

	def vehicle_owner_params 
      params.require(:vehicle_owner).permit(:surname, :first_name, :middle_name, :full_name, :gender, :birthday,
      	:email, :mobile_one, :mobile_two, :work_phone_one, :work_phone_two, :home_address, :business_address, :state_of_origin)
    end

    def self.create_with_full_name(params)
    	create(:surname => params[:surname], :first_name => params[:first_name], 
    		:middle_name => params[:middle_name], :full_name => "#{params[:surname]} #{params[:first_name]} #{params[:middle_name]}", 
    		:gender => params[:gender], :birthday => params[:birthday], :email => [:email], :mobile_one => params[:mobile_one],
    		:mobile_two => params[:mobile_two], :work_phone_one => params[:work_phone_one], 
    		:work_phone_two => params[:work_phone_two], :home_address => params[:home_address], 
    		:business_address => params[:business_address], :state_of_origin => params[:state_of_origin])

    end

end
