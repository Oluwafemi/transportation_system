class CreateVehicleTypes < ActiveRecord::Migration
  def change
    create_table :vehicle_types do |t|
      t.string :type_name
      t.string :description

      t.timestamps
    end

    add_index :vehicle_types, [:type_name], :unique => true, :name => 'typename'
  end
end
