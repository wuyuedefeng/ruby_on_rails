class Location < ActiveRecord::Base
  belongs_to :loc, polymorphic: true
end
