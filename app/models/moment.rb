# 朋友圈
class Moment < ActiveRecord::Base
  belongs_to :user
  # rails 4.1之前
  # belongs_to :user, :inverse_of => :moments

  has_one  :location, :as => :loc
end
