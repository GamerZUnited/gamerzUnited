class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title 
      t.string :console
      t.string :genre 

      t.timestamps null: false
    end
  end
end
