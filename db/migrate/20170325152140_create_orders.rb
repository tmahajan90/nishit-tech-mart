class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :delivery_on
      t.references :member, foreign_key: true
      t.references :vehicle_detail, foreign_key: true

      t.timestamps
    end
  end
end
