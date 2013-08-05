class CreateVehicleOwners < ActiveRecord::Migration
  def change
    create_table :vehicle_owners do |t|
      t.string :surname
      t.string :first_name
      t.string :middle_name
      t.string :gender
      t.date :birthday
      t.string :email
      t.string :mobile_one
      t.string :mobile_two
      t.string :work_phone_one
      t.string :work_phone_two
      t.string :home_address
      t.string :business_address
      t.string :state_of_origin
      
      t.timestamps
    end

    add_index :vehicle_owners, [:surname, :first_name, :middle_name, :gender], :unique => true, :name => 'vo_fullnames_gender_index'

  end
end

