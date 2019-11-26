class User < ApplicationRecord
has_many :positions
has_many :cashouts
has_many :arbitrages

end
