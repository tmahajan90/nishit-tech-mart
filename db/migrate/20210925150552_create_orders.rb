class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :delivery_on
      t.references :client, foreign_key: true
      t.references :vehicle_detail, foreign_key: true
      t.boolean :delivered, default: false

      t.timestamps
    end
  end
end
