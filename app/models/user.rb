# 用户
class User < ActiveRecord::Base
  has_many :moments
  has_and_belongs_to_many :official_accounts, :join_table => "user_follow_official_accounts"
  # 多态
  has_one  :location, :as => :loc
end

# belongs_to
# has_one
# has_many
# has_and_belongs_to_many [habtm]