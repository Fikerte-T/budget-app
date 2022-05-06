class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', dependent: :destroy
  belongs_to :category, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
