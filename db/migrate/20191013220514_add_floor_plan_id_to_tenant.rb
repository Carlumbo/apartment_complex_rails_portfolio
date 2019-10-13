class AddFloorPlanIdToTenant < ActiveRecord::Migration[6.0]
    def change 
        add_column :tenants, :floor_plan_id, :integer
    end 
end 