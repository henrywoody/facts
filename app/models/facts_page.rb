class FactsPage < ApplicationRecord
	has_many :join_topic_facts_pages, dependent: :destroy
	has_many :topics, through: :join_topic_facts_pages
	belongs_to :user

	accepts_nested_attributes_for :join_topic_facts_pages, allow_destroy: true

	validates :title, presence: true
end
