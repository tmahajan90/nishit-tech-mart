class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.string :mobile_no
      t.string :address
      t.string :aadhaar_no
      t.string :pan_no

      t.timestamps
    end
  end
end
