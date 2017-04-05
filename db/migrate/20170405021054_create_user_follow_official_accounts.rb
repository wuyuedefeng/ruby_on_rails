class CreateUserFollowOfficialAccounts < ActiveRecord::Migration
  def change
    create_table :user_follow_official_accounts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :official_account, index: true, foreign_key: true
    end
  end
end

# rails g migration CreateUserFollowOfficialAccounts user:references official_account:references
