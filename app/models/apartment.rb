class Apartment < ApplicationRecord 
    belongs_to :landlord
    has_many :floor_plans
    accepts_nested_attributes_for :floor_plans
    validates :name, presence:  true 
    validates_numericality_of :num_of_floor_plans

 

end 