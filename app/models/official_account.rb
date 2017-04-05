# 公众号
class OfficialAccount < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => "user_follow_official_accounts"
end
