class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :province
      # t.references :loc, index: true, foreign_key: true
      t.references :loc, polymorphic: true # 多态：loc_id, loc_type

      t.timestamps null: false
    end
  end
end

# rails g model Location province:string loc:references