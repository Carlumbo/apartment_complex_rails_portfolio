class Tenant < ApplicationRecord
    belongs_to :user 
    belongs_to :floor_plan
end
