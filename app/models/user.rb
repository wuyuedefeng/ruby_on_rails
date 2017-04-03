class User < ActiveRecord::Base
   validates :name, presence: true # 不能为空
   # validates :name, length: {minimum: 3} # 最少3个字符
   # validates :name, length: {maximum: 20} # 最多20个字符
   # validates :name, length: {in: 3..20} # 3 - 20 个字符
   # validates :name, length: {is: 5} # 必须是5个字符


   validates :phone_number, presence: true # 不能为空
   # validates :phone_number, absence: true # 必须为空

  validates :password, confirmation: true # 自动添加虚拟字段： password_confirmation, password_confirmation不为空才会验证
  validates :password_confirmation, presence: true
end
