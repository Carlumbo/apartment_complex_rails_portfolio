class Layout < ApplicationRecord
    has_many :floor_layouts
    has_many :floor_plans, through: :floor_layouts
end 