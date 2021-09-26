class CreateVehicleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicle_details do |t|
      t.integer :item_id
      t.string :chassis_no
      t.string :engine_no
      t.string :controller_no
      t.string :motor_no
      t.string :charger_no_1
      t.string :charger_no_2
      t.integer :color_id
      t.integer :make_of_battery
      t.integer :battery_id
      t.string :manual_no

      t.timestamps
    end
  end
end
