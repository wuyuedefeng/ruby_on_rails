class CreateOfficialAccounts < ActiveRecord::Migration
  def change
    create_table :official_accounts do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
