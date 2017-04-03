# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     if record.name.nil?
#       record.errors[:name] << "用户名不能为空"
#     end
#     if record.phone_number.nil?
#       record.errors[:phone_number] << "手机号不能为空"
#     end
#   end
# end

# class NameValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     if value.nil?
#       record.errors[attribute] << '用户名不能为空'
#     end
#   end
# end

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
   # validates :name, uniqueness: {allow_nil: true} # 允许为空， 不为空才验证唯一性
   # validates :name, uniqueness: {allow_blank: true} # 允许为空， 不为空才验证唯一性

  # validates :password, confirmation: true # 自动添加虚拟字段： password_confirmation, password_confirmation不为空才会验证
  # validates :password, :password_confirmation, presence: {on: :create, message: '密码和确认密码不能为空'} # 只在创建的时候去验证存在性

  # validates :province, inclusion: {in: ["北京", "上海"]} # province的值必须在列表中
  # validates :province, exclusion: {in: ["日本"]} # province的值不能是列表中的值

  # 条件验证

  # validates :phone_number, uniqueness: true, :if => "name.nil" # name属性为nil才进行验证

  # validates :phone_number, uniqueness: true, :if => Proc.new {name.nil?} # name属性为nil才进行验证

  # validates :phone_number, uniqueness: true, :if => :test? # test? 方法返回true才进行验证
  # def test?
  #   true
  # end

  # with_options if: :test? do
  #   validates :name, presence: true
  #   validates :phone_number, presence: true
  # end
  # def test?
  #   1 + 1 == 2
  # end

  # 自定义验证类
  # validates_with MyValidator

  # validates :name, name: true # 会自动调用NameValidator

  # 自定义验证方法

  # validate :my_validator # 所有验证在一个方法中
  # def my_validator
  #   if name.nil?
  #     errors[:name] << '用户名不能为空'
  #   end
  #   if phone_number
  #     errors[:phone_number] << '电话号码不能为空'
  #   end
  # end
  #
  # validate :name_validator, :phone_number_validator # 多个验证单独执行， 按顺序执行
  # def name_validator
  #   if name.nil?
  #     errors[:name] << '用户名不能为空'
  #   end
  # end
  # def phone_number_validator
  #   if phone_number
  #     errors[:phone_number] << '电话号码不能为空'
  #   end
  # end


end
