class UserPage < ApplicationRecord
	has_many :join_topic_user_pages, dependent: :destroy
	has_many :topics, through: :join_topic_user_pages
	belongs_to :user

	accepts_nested_attributes_for :join_topic_user_pages, allow_destroy: true

	validates :title, presence: true
end
