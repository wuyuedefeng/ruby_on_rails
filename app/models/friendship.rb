class Friendship < ActiveRecord::Base
  belongs_to :inviter, :class_name => "User"
  belongs_to :acceptor, :class_name => "User"
end
