class Category < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :purchases
end

validates :name, presence: true, length: { maximum: 50 }
validates :icon, presence: true