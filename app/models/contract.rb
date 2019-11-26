class Contract < ApplicationRecord

has_many :values
belongs_to :market, required: false

end
