class JoinTopicUserPage < ApplicationRecord
  belongs_to :topic, optional: true
  belongs_to :user_page, optional: true

  validates :topic, presence: true
  validates :user_page, presence: true
end
