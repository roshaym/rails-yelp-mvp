class Restaurant < ApplicationRecord
  TYPE = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: Restaurant::TYPE }
end
