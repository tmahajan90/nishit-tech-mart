class VehicleDetail < ApplicationRecord
    belongs_to :item
    belongs_to :color
    has_many :client, through: :order

    validates :item_id, :presence => true
    validates :color_id, :presence => true
    validates :engine_no, :presence => true
    validates :chassis_no, :presence => true
    validates :controller_no, :presence => true
    validates :motor_no, :presence => true
    validates :color, :presence => true
    validates :make_of_battery, :presence => true
    validates :battery_id, :presence => true
end
