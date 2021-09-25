class CreateItemDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :item_details do |t|
      t.string :chassie_no

      t.timestamps
    end
  end
end
