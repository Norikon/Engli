class Example < ApplicationRecord
  include PublicActivity::Common
  include SharedMethods

  belongs_to :phrase
  belongs_to :user
  acts_as_votable
  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity', dependent: :destroy


  validates :example, :phrase_id, :user_id, presence: true
  validates_uniqueness_of :example, scope: :phrase_id, :message => 'Has already been used!'
end
