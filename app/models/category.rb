class Category < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :purchases
end
