class Review < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
  validates :rating, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
