require 'open-uri'
require 'nokogiri'
require 'wikipedia'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#some cleaning
Item.destroy_all
Topic.destroy_all

#WARS
all_wars = Topic.create(title: "Wars", description: "All documented wars")

wars_topics = []
wars_topics << Topic.create(title: "Wars Before 1000 A.D.", description: "All documented wars before 1000 A.D.")
wars_topics << Topic.create(title: "Wars 1000 - 1499", description: "All wars from 1000 to 1499")
wars_topics << Topic.create(title: "Wars 1500 - 1799", description: "All wars from 1500 to 1799")
wars_topics << Topic.create(title: "Wars 1800 - 1899", description: "All wars from 1800 to 1899")
wars_topics << Topic.create(title: "Wars 1900 - 1944", description: "All wars from 1900 to 1944")
wars_topics << Topic.create(title: "Wars 1945 - 1989", description: "All wars from 1945 to 1989")
wars_topics << Topic.create(title: "Wars 1990 - 2002", description: "All wars from 1990 to 2002")
wars_topics << Topic.create(title: "Wars 2003 - 2010", description: "All wars from 2003 to 2010")
wars_topics << Topic.create(title: "Wars 2011 - present", description: "All wars from 2011 to the present")

war_links = ['https://en.wikipedia.org/wiki/List_of_wars_before_1000', 'https://en.wikipedia.org/wiki/List_of_wars_1000%E2%80%931499', 'https://en.wikipedia.org/wiki/List_of_wars_1500%E2%80%931799', 'https://en.wikipedia.org/wiki/List_of_wars_1800%E2%80%9399', 'https://en.wikipedia.org/wiki/List_of_wars_1900%E2%80%9344', 'https://en.wikipedia.org/wiki/List_of_wars_1945%E2%80%9389', 'https://en.wikipedia.org/wiki/List_of_wars_1990%E2%80%932002', 'https://en.wikipedia.org/wiki/List_of_wars_2003%E2%80%9310', 'https://en.wikipedia.org/wiki/List_of_wars_2011%E2%80%93present']

war_links.each do |link|
	wars_in_time_period =  Nokogiri::HTML(open(link))
	tables = wars_in_time_period.css('table.wikitable')
	tables.each do |table|
		rows = table.css('tr')
		rows.shift
		rows.shift
		rows.each do |row|
			title = row.css('a').first.children.to_s#link_content.css('h1#firstHeading.firstHeading').first.children.first.to_s

			link_ending = row.css('a').first.attributes['href'].value
			war_link = "https://en.wikipedia.org" + link_ending

			page = Wikipedia.find(war_link)
			#image
			img_urls = page.image_urls
			img_url = (img_urls != nil) ? img_urls.sample : nil
			#description
			description = page.summary

			war = Item.create(title: title, link: war_link, image_url: img_url, description: description)
			JoinItemTopic.create(item: war, topic: all_wars)
			JoinItemTopic.create(item: war, topic: wars_topics[war_links.index(link)])
		end
	end
end


#COLORS
#colors = Topic.create(title: "Colors", description: "Any color you could think of.")
