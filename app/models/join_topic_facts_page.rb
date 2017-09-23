class JoinTopicFactsPage < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :facts_page, optional: true

  validates :topic, presence: true
  validates :facts_page, presence: true
end
