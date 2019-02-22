class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :phrases
  has_many :examples

  validates :username, presence: true
  validates :username, uniqueness: true

end
