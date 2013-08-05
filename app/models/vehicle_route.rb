class VehicleRoute < ActiveRecord::Base
	has_many :vehicles, :dependent => :nullify
end
