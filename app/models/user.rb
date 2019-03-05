class User < ApplicationRecord
  include PublicActivity::Common
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  has_many :phrases
  has_many :examples

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :age, presence: true
  validates :city, presence: true
  validates :identity, inclusion: { in: [ true, false ] }


  def has_new_notifications?
    PublicActivity::Activity.where(recipient_id: self.id, readed: false).any?
  end
end
