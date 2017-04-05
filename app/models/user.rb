class User < ActiveRecord::Base
  has_many :moments
end

# belongs_to
# has_one
# has_many
# has_and_belongs_to_many [habtm]