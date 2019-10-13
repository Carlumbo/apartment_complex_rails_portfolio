class CreateFloorPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :floor_plans do |t|
      t.string :type
      t.integer :max_tenants
      t.integer :apartment_id
      t.integer :price
      t.string :description
      
      t.timestamps
    end
  end
end
