class Purchase < ApplicationRecord
  belongs_to :author, class_name: 'User', dependent: :destroy
  belongs_to :category, dependent: :destroy
end