# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 搭建数据库
# rake db:setup 根据迁移文件搭建数据库，并填充种子文件

# 只填充种子数据
# rake db:seed

# 重建数据库
# rake db:reset

# 不同环境中运行迁移
# rake db:migrate RAILS_ENV=test

10.times do |n|
  User.create(:name => "name#{n}", :phone_number => n, :gender => '男')
end