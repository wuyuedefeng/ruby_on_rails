# 朋友圈
class Moment < ActiveRecord::Base
  belongs_to :user
  has_one  :location, :as => :loc
end
