class Item < ApplicationRecord
	has_many :join_item_topics, dependent: :destroy
	has_many :topics, through: :join_item_topics

	accepts_nested_attributes_for :join_item_topics, allow_destroy: true

	validates :title, presence: true
end
