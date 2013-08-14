class AddIndexToVehicleOwner < ActiveRecord::Migration
  def change
  end
  add_index :vehicle_owners, [:full_name], :unique => true, :name => 'ownersfullnameindex'
end
