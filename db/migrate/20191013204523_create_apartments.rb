class CreateApartments < ActiveRecord::Migration[6.0]
    def change 
        create_table :apartments do |t|
            t.string :name 
            t.string :address 
            t.integer :landlord_id
            t.integer :num_of_floor_plans

            t.timestamps
        end 
    end 
end 