class CreateVehicleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_details do |t|
      t.integer :item_id
      t.string :chassie_no
      t.string :engine_no
      t.string :controller_no
      t.string :motor_no
      t.string :charger_no

      t.timestamps
    end
  end
end
