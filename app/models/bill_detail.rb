class BillDetail < ApplicationRecord
    belongs_to :order
    validates_uniqueness_of :order_id

    validates :order_id, presence: true
    validates :base_price, presence: true
    validates :gst_price, presence: true
    validates :subsidy_price, presence: true
    validates :total_price, presence: true

    before_create :generate_invoice_number


    private

    def generate_invoice_number
        if (BillDetail.all.length > 0)
            self.invoice_no = BillDetail.maximum(:invoice_no) + 1
        else
            self.invoice_no = 251
        end   
    end

end
