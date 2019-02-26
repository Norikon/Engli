class User < ApplicationRecord
  include PublicActivity::Common
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :phrases
  has_many :examples

  validates :username, presence: true
  validates :username, uniqueness: true

  def has_new_notifications?
    PublicActivity::Activity.where(recipient_id: self.id, readed: false).any?
  end
end
