class Transact < ApplicationRecord
  belongs_to:categories

  validates :name, presence: true
  validates :amout, presence: true, numericality: { greater_than: 0 }
  validates :category_id, presence: true
end
