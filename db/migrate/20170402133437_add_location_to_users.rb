class AddLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
  end
end


# 添加location字段
# rails g migration addLocationToUsers location:string

# 删除location字段
# rails d migration removeLocationFromUsers location:string