class AddUserIdToGamerInfos < ActiveRecord::Migration
  def change
    add_column :gamer_infos, :user_id, :integer
  end
end
