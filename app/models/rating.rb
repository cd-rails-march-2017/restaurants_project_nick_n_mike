class Rating < ApplicationRecord
  validates_inclusion_of :rating, in: [1,2,3,4,5]
  belongs_to :user
  belongs_to :restaurant
end
