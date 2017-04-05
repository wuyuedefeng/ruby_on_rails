class CreateUserFollowUsers < ActiveRecord::Migration
  def change
    create_table :user_follow_users do |t|
      t.references :follower, index: true, foreign_key: true
      t.references :followee, index: true, foreign_key: true
    end
  end
end

# rails g migration CreateUserFollowUsers follower:references followee:references
