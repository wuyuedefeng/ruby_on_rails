class RenameAccountsToUsers < ActiveRecord::Migration
  def change
    rename_table :accounts, :users
  end
end

# rails g migration renameAccountsToUsers