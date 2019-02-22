class Example < ApplicationRecord
  include SharedMethods

  belongs_to :phrase
  belongs_to :user

  validates :example, :phrase_id, :user_id, presence: true
  validates_uniqueness_of :example, scope: :phrase_id, :message => 'Has already been used!'
end
