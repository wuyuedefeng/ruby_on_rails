# 用户
class User < ActiveRecord::Base
  has_many :moments
  # rails 4.1之前
  # has_many :moments, :inverse_of => :user

  has_and_belongs_to_many :official_accounts, :join_table => "user_follow_official_accounts"

  # 多态
  has_one  :location, :as => :loc

  # 自关联
  has_and_belongs_to_many :followers, :join_table => "user_follow_users", :class_name => "User", :foreign_key => "followee_id", :association_foreign_key => "follower_id"
end

# belongs_to
# has_one
# has_many
# has_and_belongs_to_many [habtm]