class VehicleDetail < ApplicationRecord
    belongs_to :item
    has_many :client, through: :order

    validates :item_id, :presence => true
    validates :engine_no, :presence => true
    validates :chassis_no, :presence => true
end
