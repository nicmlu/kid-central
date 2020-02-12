class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name 
      t.date :date
      t.time :time 
      t.string :location
      t.string :rsvp
      t.string :gift
      t.string :note
      t.integer :kid_id 
    end
  end
end
