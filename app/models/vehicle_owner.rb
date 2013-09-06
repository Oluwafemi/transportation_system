class VehicleOwner < ActiveRecord::Base

	validates :surname, :first_name, :gender, :mobile_one, :home_address, :business_address, :state_of_origin, :presence => true

    has_many :vehicles

	def vehicle_owner_params 
      params.require(:vehicle_owner).permit(:surname, :first_name, :middle_name, :gender, :birthday,
      	:email, :mobile_one, :mobile_two, :work_phone_one, :work_phone_two, :home_address, :business_address, :state_of_origin)
    end

    def name
        full_name
    end

    def to_s
        full_name
    end

    def self.available_vehicle_owners
        all.map { |owner| owner.full_name }
    end

    def self.owner_id(full_name)
        
        rel = where('full_name = ?', full_name)

        return nil if rel.empty?

        return rel[0].id
    end

    def self.vehicle_owner_suggestions(search_by)
        where('full_name LIKE ?', "#{search_by}%")
    end

end

#def self.create_with_full_name(params)
    #   create(:surname => params[:surname], :first_name => params[:first_name], 
    #       :middle_name => params[:middle_name], :full_name => "#{params[:surname]} #{params[:first_name]} #{params[:middle_name]}", 
    #       :gender => params[:gender], :birthday => params[:birthday], :email => [:email], :mobile_one => params[:mobile_one],
    #       :mobile_two => params[:mobile_two], :work_phone_one => params[:work_phone_one], 
    #       :work_phone_two => params[:work_phone_two], :home_address => params[:home_address], 
    #       :business_address => params[:business_address], :state_of_origin => params[:state_of_origin])
#end
# alias_attribute :name, :project_name 
