class User < ApplicationRecord
  has_many :categories, foreign_key: 'author_id', dependent: :destory
  has_many :transacts, through: :categories

  validates :name, presence: true, length: { maximum: 50 }
end
