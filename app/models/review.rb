class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, presence:true
  validates :rating, numericality: true, inclusion: { in:(0..5).to_a}
  # also it can be: numericality: only integer:true}, inclusion => 0..5
end
