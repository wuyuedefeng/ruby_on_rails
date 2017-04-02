class DropUsers < ActiveRecord::Migration
  def change
    ## 删除表，如果需要回滚 ， 需要传递代码块，否则无法回滚
    # drop_table :users do |t|
    #   t.string :name
    #   t.string :phone_number
    #   t.string :gender
    #
    #   t.timestamps null: false
    # end
  end



  # 可以使用up 和 down 方法进行迁移， up方法是执行数据库迁移时 执行， down方法是rollback时候执行
  # def up
  #   change_column :users, :money, :integer
  # end
  #
  # def down
  #   change_column :users, :money, :decimal
  # end
end


# rails g migration dropUsers