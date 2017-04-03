class AddProvinceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :province, :string
  end
end


# rails g migration addProvinceToUsers province:string