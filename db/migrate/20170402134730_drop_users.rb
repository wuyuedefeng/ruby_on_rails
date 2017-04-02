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
end


# rails g migration dropUsers