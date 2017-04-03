class User < ActiveRecord::Base
   # validates :name, presence: true # 不能为空
   # validates :name, length: {minimum: 3} # 最少3个字符
   # validates :name, length: {maximum: 20} # 最多20个字符
   # validates :name, length: {in: 3..20} # 3 - 20 个字符
   # validates :name, length: {is: 5} # 必须是5个字符
   # validates :name, uniqueness: true


   # validates :phone_number, presence: true # 不能为空
   # validates :phone_number, absence: true # 必须为空
   # validates :phone_number, format: {with: /1[0-9]{10}\z/} # 正则匹配验证

  # validates :password, confirmation: true # 自动添加虚拟字段： password_confirmation, password_confirmation不为空才会验证
  # validates :password, :password_confirmation, presence: {on: :create, message: '密码和确认密码不能为空'} # 只在创建的时候去验证存在性

  # validates :province, inclusion: {in: ["北京", "上海"]} # province的值必须在列表中
  # validates :province, exclusion: {in: ["日本"]} # province的值不能是列表中的值

  # 条件验证

end
