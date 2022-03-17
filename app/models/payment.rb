class Payment < ApplicationRecord
  has_many :groups
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end