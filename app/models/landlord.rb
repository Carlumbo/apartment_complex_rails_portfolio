class Landlord < ApplicationRecord
    belongs_to :user
    has_many :apartments
    has_many :floor_plans, through: :apartments
    has_many :tenents, through: :floor_plans
    validates :name, presence: true
end
