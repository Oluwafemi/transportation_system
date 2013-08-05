class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :plate_number
      t.string :pin_number

      t.references :vehicle_type, :null => false
      t.references :vehicle_owner, :null => false

      t.timestamps
    end
    
    add_foreign_key(:vehicles, :vehicle_types, dependent: :destroy)
    add_foreign_key(:vehicles, :vehicle_owners, dependent: :destroy)
    add_index :vehicles, [:plate_number], :unique => true, :name => 'platenumber'
    add_index :vehicles, [:pin_number], :unique => true, :name => 'pinnumber'
  end
end