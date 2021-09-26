class CreateBillDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_details do |t|
      t.references :order, foreign_key: true
      t.string :base_price
      t.string :gst_price #5%
      t.string :subsidy_price
      t.string :total_price
      t.integer :invoice_no

      t.timestamps
    end
  end
end
