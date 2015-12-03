class RemoveGamertagFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :gamertag, :string
  end
end
