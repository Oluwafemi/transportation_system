class VehicleType < ActiveRecord::Base
	validates :type_name, :description, :presence => true

	has_many :vehicles
	
	def vehicle_type_params 
      params.require(:vehicle_type).permit(:type_name, :description)
    end

    def name
    	type_name
    end

    def to_s
    	type_name
    end

    def self.type_id(v_type_name)
        rel = where('type_name = ?', v_type_name)

        return nil if rel.empty?

        return rel[0].id
    end

    def self.vehicle_type_suggestions(search_by)
	    where('type_name LIKE ?', "#{search_by}%")
	end
end
