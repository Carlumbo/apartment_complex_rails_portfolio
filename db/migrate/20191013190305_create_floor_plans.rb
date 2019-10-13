class CreateFloorPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :floor_plans do |t|

      t.timestamps
    end
  end
end
