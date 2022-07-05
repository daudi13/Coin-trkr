class Transact < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true
end
