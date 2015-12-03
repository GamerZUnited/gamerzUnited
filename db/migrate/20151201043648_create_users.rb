class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :gamertag
      t.string :email, null: false
      t.string :password_digest
      t.string :access_token
      t.integer :age
      t.string :sex
      t.attachment :avatar

      t.timestamps null: false
    end
  end

  def self.down
    remove_attachment :users, :avatar
  end
end
