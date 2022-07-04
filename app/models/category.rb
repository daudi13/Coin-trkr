class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :transacts, dependent: :destory

  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
end
