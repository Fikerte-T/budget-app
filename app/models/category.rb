class Category < ApplicationRecord
  belongs_to :user
  has_many :category_purchases, dependent: :destroy
  has_many :purchases, through: :category_purchases
end
