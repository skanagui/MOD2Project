class CreateMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :meetups do |t|
      t.string :purpose
      t.integer :time 
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
