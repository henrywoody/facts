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
# Item.destroy_all
# Topic.destroy_all

wikipedia_base_url = "https://en.wikipedia.org"

# #WARS
# all_wars = Topic.create(title: "Wars", description: "All documented wars")

# wars_topics = []
# wars_topics << Topic.create(title: "Wars Before 1000 A.D.", description: "All documented wars before 1000 A.D.")
# wars_topics << Topic.create(title: "Wars 1000 - 1499", description: "All wars from 1000 to 1499")
# wars_topics << Topic.create(title: "Wars 1500 - 1799", description: "All wars from 1500 to 1799")
# wars_topics << Topic.create(title: "Wars 1800 - 1899", description: "All wars from 1800 to 1899")
# wars_topics << Topic.create(title: "Wars 1900 - 1944", description: "All wars from 1900 to 1944")
# wars_topics << Topic.create(title: "Wars 1945 - 1989", description: "All wars from 1945 to 1989")
# wars_topics << Topic.create(title: "Wars 1990 - 2002", description: "All wars from 1990 to 2002")
# wars_topics << Topic.create(title: "Wars 2003 - 2010", description: "All wars from 2003 to 2010")
# wars_topics << Topic.create(title: "Wars 2011 - present", description: "All wars from 2011 to the present")

# war_links = ['https://en.wikipedia.org/wiki/List_of_wars_before_1000', 'https://en.wikipedia.org/wiki/List_of_wars_1000%E2%80%931499', 'https://en.wikipedia.org/wiki/List_of_wars_1500%E2%80%931799', 'https://en.wikipedia.org/wiki/List_of_wars_1800%E2%80%9399', 'https://en.wikipedia.org/wiki/List_of_wars_1900%E2%80%9344', 'https://en.wikipedia.org/wiki/List_of_wars_1945%E2%80%9389', 'https://en.wikipedia.org/wiki/List_of_wars_1990%E2%80%932002', 'https://en.wikipedia.org/wiki/List_of_wars_2003%E2%80%9310', 'https://en.wikipedia.org/wiki/List_of_wars_2011%E2%80%93present']

# war_links.each do |link|
# 	wars_in_time_period =  Nokogiri::HTML(open(link))
# 	tables = wars_in_time_period.css('table.wikitable')
# 	tables.each do |table|
# 		rows = table.css('tr')
# 		rows.shift
# 		rows.shift
# 		rows.each do |row|
# 			title = row.css('a').first.children.to_s#link_content.css('h1#firstHeading.firstHeading').first.children.first.to_s

# 			link_ending = row.css('a').first.attributes['href'].value
# 			war_link = wikipedia_base_url + link_ending

# 			page = Wikipedia.find(war_link)

# 			#image
# 			img_url = page.main_image_url

# 			#description
# 			description = page.summary

# 			war = Item.create(title: title, link: war_link, image_url: img_url, description: description)
# 			JoinItemTopic.create(item: war, topic: all_wars)
# 			JoinItemTopic.create(item: war, topic: wars_topics[war_links.index(link)])
# 		end
# 	end
# end



# #FLAGS
# all_flags = Topic.create(title: "Flags", description: "As many flags as we could find")

# flag_topics = []
# flag_topics << Topic.create(title: "National Flags", description: "Flags from the nations of the world")


# flag_set_urls = ['https://en.wikipedia.org/wiki/Gallery_of_sovereign_state_flags']
# flag_url_collections = [[]]

# flag_set_urls.each do |url|
# 	web = Nokogiri::HTML(open(url))
# 	web.css('#bodyContent').css('#mw-content-text').css('table').each do |tab|
# 		lnk = tab.css('tr').css('td').css('a')[1]['href']
# 		flag_url_collections[flag_set_urls.index(url)] << lnk
# 		break if lnk == '/wiki/Flag_of_Transnistria'
# 	end
# end

# flag_url_collections.each do |flag_url_collection|
# 	flag_url_collection.uniq!
# 	flag_url_collection.each do |flag_url|
# 		full_flag_url = wikipedia_base_url + flag_url
# 		flag_page = Wikipedia.find(full_flag_url)
# 		title = flag_page.title
# 		img_url = flag_page.main_image_url
# 		description = flag_page.summary
# 		flag = Item.create(title: title, link: full_flag_url, image_url: img_url, description: description)
# 		JoinItemTopic.create(item: flag, topic: all_flags)
# 		JoinItemTopic.create(item: flag, topic: flag_topics[flag_url_collections.index(flag_url_collection)])
# 	end
# end



# #US PRESIDENTS
# us_presidents = Topic.create(title: 'US Presidents', description: 'All the presidents of the United States')

# all_pres_page = 'https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States'
# pres_url_ends = []

# pres_web = Nokogiri::HTML(open(all_pres_page))
# pres_web.css('table.wikitable').css('tr').css('big').css('a').each do |pres_link|
# 	pres_url_ends << pres_link.attributes['href'].value
# end

# pres_url_ends.uniq!

# pres_url_ends.each do |pres_url_end|
# 	full_pres_url = wikipedia_base_url + pres_url_end
# 	pres_page = Wikipedia.find(full_pres_url)
# 	title = pres_page.title
# 	img_url = pres_page.main_image_url
# 	description = pres_page.summary
# 	president = Item.create(title: title, link: full_pres_url, image_url: img_url, description: description)
# 	JoinItemTopic.create(item: president, topic: us_presidents)
# end


# #COLORS
# colors = Topic.create(title: 'Colors', description: 'Lots of different colors')

# color_vals = []

# (0..255).each do |a|
# 	(0..255).each do |b|
# 		(0..255).each do |c|

# 		end
# 	end
# end


#PROGRAMMING LANGUAGES
prog_langs = Topic.create(title: 'Programming Languages', description: 'Likely all of the programming languages known to man')

prog_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_programming_languages'))
prog_url_ends = []

prog_list_web.css('div.div-col.columns.column-count.column-count-2').css('li').css('a').each do |i|
	prog_url_ends << i.attributes['href'].value
end

puts prog_url_ends

prog_url_ends.each do |url_end|
	puts url_end
	full_url = wikipedia_base_url + url_end
	next if full_url == 'https://en.wikipedia.org/wiki/A%2B_(programming_language)' or full_url == 'https://en.wikipedia.org/wiki/Visual_J%2B%2B' or full_url == 'https://en.wikipedia.org/wiki/Visual_J'
	prog_page = Wikipedia.find(url_end)
	title = prog_page.title
	img_url = prog_page.main_image_url
	description = prog_page.summary
	prog_lang = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: prog_lang, topic: prog_langs)
end




#DOG BREEDS
dogs = Topic.create(title: 'Dog Breeds', description: 'Lots of breeds of dogs')

dog_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_dog_breeds'))
dog_url_ends = []

table = dog_list_web.css('table').first.css('tr')
table.shift
table.pop
table.each do |row|
	dog_url_ends << row.css('td').first.css('a').first.attributes['href'].value
end

dog_url_ends.each do |url_end|
	full_url = wikipedia_base_url + url_end
	page = Wikipedia.find(full_url)
	title = page.title
	img_url = page.main_image_url
	description = page.summary
	dog = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: dog, topic: dogs)
end



#CITIES
cities = Topic.create(title: 'Cities', description: 'Most somewhat large cities in the world')

city_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_cities_by_GDP'))
city_url_ends = []

table = city_list_web.css('table').first.css('tr')
table.shift
table.pop
table.each do |row|
	city_url_ends << row.css('td').first.css('a').first.attributes['href'].value
end

city_url_ends.each do |url_end|
	full_url = wikipedia_base_url + url_end
	page = Wikipedia.find(full_url)
	title = page.title
	img_url = page.main_image_url
	description = page.summary
	city = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: city, topic: cities)
end



#CONSTELLATIONS
constellations = Topic.create(title: 'Modern Constellations', description: '88 modern constellations')

const_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/88_modern_constellations'))
const_url_ends = []

const_list_web.css('.navbox').first.css('tr')[1].css('li').css('a').each do |le|
	const_url_ends << le['href']
end

const_url_ends.each do |url_end|
	full_url = wikipedia_base_url + url_end
	page = Wikipedia.find(full_url)
	title = page.title
	img_url = page.main_image_url
	description = page.summary
	constellation = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: constellation, topic: constellations)
end






