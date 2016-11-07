class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { in: 6..20 }
  validates :email, presence: true, uniqueness: true
  has_many :posts
  has_many :comments
end
