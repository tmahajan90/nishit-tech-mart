class BillDetail < ApplicationRecord
    belongs_to :order
    validates_uniqueness_of :order_id

    validates :order_id, presence: true
    validates :base_price, presence: true
    validates :gst_price, presence: true
    validates :subsidy_price, presence: true
    validates :total_price, presence: true


end
