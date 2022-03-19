class Group < ApplicationRecord
  has_many :payments, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
