class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name 
      t.string :nickname
      t.string :gender 
      t.date :birthdate
      t.integer :user_id
    end
  end
end
