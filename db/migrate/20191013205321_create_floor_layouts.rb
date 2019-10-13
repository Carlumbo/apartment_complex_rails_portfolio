class CreateFloorLayouts < ActiveRecord::Migration[6.0]
    def change 
        create_table :floor_layouts do |t|
            t.integer :floor_plan_id
            t.integer :layout_id 
            t.integer :quantity
            
            t.timestamps
        end 
    end 
end 