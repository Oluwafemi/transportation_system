class CreateVehicleRoutes < ActiveRecord::Migration
  def change
    create_table :vehicle_routes do |t|
      t.string :route_number
      t.string :first_end
      t.string :second_end
      
      t.timestamps
    end
    
    add_index :vehicle_routes, [:route_number], :unique => true, :name => 'routenumber'
    add_index :vehicle_routes, [:first_end, :second_end], :unique => true, :name => 'firstendsecondend'
  end
end