class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
  end
end

# rails g migration addLocationToUser location:string
