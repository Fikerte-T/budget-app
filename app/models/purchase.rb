class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories, through: :category_purchases
  has_many :category_purchases, dependent: :destroy
end
