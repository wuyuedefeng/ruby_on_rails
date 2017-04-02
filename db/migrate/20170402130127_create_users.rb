class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :gender

      t.timestamps null: false
    end
  end
end

# rails g model User name:string phone_number:string gender:string