class CreateGamerInfos < ActiveRecord::Migration
  def change
    create_table :gamer_infos do |t|
    	t.string :gamertag
        t.string :location
        t.integer :gamerscore
        t.string :avatarBodyImagePath

      t.timestamps null: false
    end
  end
end
