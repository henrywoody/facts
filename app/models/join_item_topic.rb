class JoinItemTopic < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :topic, optional: true

  validates :item, presence: true
  validates :topic, presence: true
end
