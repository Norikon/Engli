class Phrase < ActiveRecord::Base
  include SharedMethods
  extend FriendlyId

  belongs_to :user
  has_many :examples, dependent: :destroy
  accepts_nested_attributes_for :examples, allow_destroy: true

  friendly_id :phrase, use: :slugged
  acts_as_votable

  CATEGORIES = [['Actions', 0], ['Time', 1], ['Productivity', 2], ['Apologies', 3], ['Common', 4]]
  validates :translation, :phrase, presence: true
  validates :phrase, uniqueness: true
  validates :category,
            inclusion: {
                in: %w(Actions Time Productivity Apologies Common),
                message: "%{value} is not a valid category"
            }
  enum category: {'Actions': 0, 'Time': 1, 'Productivity': 2, 'Apologies': 3, 'Common': 4}


end