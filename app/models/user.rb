module MyMethod
  def find_text text
    where(:text => text)
  end
end

# 用户
class User < ActiveRecord::Base
  has_many :moments

  # 关联回调
  # has_many :moments, before_add: :before_add, after_add: :after_add, before_remove: :before_remove, after_remove: :after_remove

  # 关联方法拓展
  # has_many :moments, :extend => MyMethod

  # rails 4.1之前
  # has_many :moments, :inverse_of => :user

  has_and_belongs_to_many :official_accounts, :join_table => "user_follow_official_accounts"

  # 多态  :validate => true 指定 User.first.create_location创建位置使用location中的验证，默认不使用验证。
  # 注册位置
  has_one  :location, :as => :loc, :validate => true

  # 自关联 # 和下面的friendship很像， 只是user_follow_users没有model， friendship创建了一个model，看情况而定
  has_and_belongs_to_many :followers, :join_table => "user_follow_users", :class_name => "User", :foreign_key => "followee_id", :association_foreign_key => "follower_id"

  # 朋友圈的所有位置
  # has_many :locations, :through => :moments
  has_many :has_beens, :through => :moments, :source => :location



  has_many :inviter_friendships, :class_name => "Friendship", :foreign_key => "acceptor_id"
  has_many :acceptor_friendships, :class_name => "Friendship", :foreign_key => "inviter_id"

  has_many :inviters, :through => :inviter_friendships
  has_many :acceptors, :through => :acceptor_friendships

  def friends
    inviters | acceptors
  end

  def before_add moment
    puts 'before_add'
  end

  def after_add moment
    puts 'after_add'
  end

  def before_remove moment
    puts 'before_remove'
  end

  def after_remove moment
    puts 'after_remove'
  end
end

### belongs_to 添加的方法
# association(force_reload = false) # Moment.first.user 从缓存读取  # Moment.first.user(true) 从数据库更新
# association=(associate) # Moment.first.user = User.last 更改朋友圈用户
# build_association(attributes={}) # m = Moment.create(:text=>'123'); m.build_user(:name => "xiaowang"); m.save # 通过朋友圈创建新用户..
# create_association(attributes={}) # m = Moment.create(:text=>'123'); m.create_user(:name => "xiaoli"); # create_user将执行sql，插入新用户到数据库
# create_association!(attributes={})

## belongs_to 选项
# * :class_name
# * :foreign_key
# * :dependent
# * :inverse_of
# * :polymorphic
# * :touch
# * :validate
# ------ if moments table 中 user_id 改为 owner_id
# belongs_to :owner, :class_name => "User" # in Moment model
# has_many :moments, :foreign_key => "owner_id" # in User model




## has_one 添加的方法
# association(force_reload = false) # User.first.location
# association=(associate) # loc = Location.create(:province => "山东"); User.first.location = loc
# build_association(attributes={}) # u = User.first; u.build_location(:province => "北京"); u.save
# create_association(attributes={}) # User.last.create_location(:province => "河北")
# create_association!(attributes={})

## has_one 选项
# * :as
# * :class_name
# * :foreign_key
# * :dependent
# * :inverse_of
# * :primary_key
# * :source
# * :through
# * :validate

## has_many 添加的方法
# collection(force_reload = false) # User.first.moments # User.first.moments(true)
# collection << (object, ..) # m = Moment.first; User.first.moments << m
# delete(object, ..) # m = Moment.first; User.first.moments.delete(m) # 解除关联，不删除
# destroy(object, ..) # m = Moment.first; User.first.moments.destroy(m) # 删除朋友圈m这条数据
# collection=objects
# collection_single_ids
# collection_single_ids = ids
# collection.clear # User.first.moments.clear 解除所有关联
# collection.empty?
# collection.size
# collection.find(..)
# collection.where(..)
# collection.exists?(..) # m = Moment.first; User.first.moments.exists? m # 返回 true or false
# collection.build(attributes={},..)
# collection.create(attributes={},..)
# collection.create!(attributes={},..)

## has_many 添加的选项
# * :as
# * :class_name
# * :dependent
# * :foreign_key
# * :inverse_of
# * :primary_key
# * :source
# * :through
# * :validate




# has_and_belongs_to_many [habtm] 添加的方法
# collection(force_reload = false) # User.first.official_accounts
# collection << (object, ..)  # o = OfficialAccount.first; User.first.official_accounts << o
# delete(object, ..)
# destroy(object, ..)
# collection=objects
# collection_single_ids
# collection_single_ids = ids
# collection.clear
# collection.empty?
# collection.size
# collection.find(..)
# collection.where(..)
# collection.exists?(..)
# collection.build(attributes={},..)
# collection.create(attributes={},..)
# collection.create!(attributes={},..)

# has_and_belongs_to_many [habtm] 添加的选项
# * :association_foreign_key
# * :class_name
# * :foreign_key
# * join_table
# * validate


## 关联回调
# * before_add
# * after_add
# * before_remove
# * after_remove
