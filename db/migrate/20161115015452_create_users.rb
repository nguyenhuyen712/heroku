class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :gender
      t.string :blood_group
      t.string :helmet_id
      t.string :phone_emergency
      t.text :description

      t.timestamps
    end
    add_index :users, :helmet_id, unique: true
  end
end
