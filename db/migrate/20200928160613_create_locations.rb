class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :description
      # t.string :search

      t.timestamps
    end
  end
end
