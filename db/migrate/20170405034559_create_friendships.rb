class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :inviter, index: true, foreign_key: true
      t.references :acceptor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

# rails g model Friendship inviter:references acceptor:references