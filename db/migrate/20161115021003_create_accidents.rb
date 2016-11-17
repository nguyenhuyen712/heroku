class CreateAccidents < ActiveRecord::Migration[5.0]
  def change
    create_table :accidents do |t|
      t.float :lati
      t.float :longti
      t.integer :status, default: false
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
