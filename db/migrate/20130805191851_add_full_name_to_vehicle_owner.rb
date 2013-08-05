class AddFullNameToVehicleOwner < ActiveRecord::Migration
  def change
    add_column :vehicle_owners, :full_name, :string
  end
  #remove_index(:vehicle_owners, :name => 'index_name')
end
