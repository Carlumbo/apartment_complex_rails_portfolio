class FloorLayout < ApplicationRecord
    belongs_to :floor_plan 
    belongs_to :layout

    validates :layout, uniqueness: {scope: :floor_plan}
    validates_numericality_of :quantity
end 