class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :destroy
  has_many :purchases, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 250, minimum: 3 }
  validates :email, presence: true, length: { maximum: 250 }
  validates_uniqueness_of :email, case_sensitive: false
end

