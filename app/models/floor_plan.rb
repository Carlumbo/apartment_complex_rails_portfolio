class FloorPlan < ApplicationRecord
    belongs_to: :apartment
    has_many :tenants 
    has_many :floor_layouts
    has_many :layouts, through: :floor_layouts
    validates :type, presence: true 
    validates_uniqueness_of :type, scope: :apartment_id
    validates_numericality_of :price
    accepts_nested_attributes_for :floor_layouts

    scope :larger_than_4_tenants, -> {where("floor_plans.max_tenants > ?", 4)}

    def layout_attributes=(layout_attributes)
        layout_attributes.values.each do |layout_attr|
            if layout_attr[:name].present? 
                layout = Layout.find_or_create_by(layout_attr)
                self.layouts << layout
            end 
        end 
    end 


    
end
