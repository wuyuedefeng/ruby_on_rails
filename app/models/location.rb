class Location < ActiveRecord::Base
  belongs_to :loc, polymorphic: true, :dependent => :destroy
  validates :province, presence: true
end
