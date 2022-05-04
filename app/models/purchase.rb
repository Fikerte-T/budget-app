class Purchase < ApplicationRecord
  has_many :categories
  belongs_to :author, class_name: 'User'
end
