class Topic < ApplicationRecord
	has_many :join_item_topics
	has_many :items, through: :join_item_topics
	has_many :join_topic_facts_pages
	has_many :facts_pages, through: :join_topic_facts_pages
end
