class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :vehicle_type_id
      t.datetime :received_on
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
