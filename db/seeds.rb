require 'open-uri'
require 'nokogiri'
require 'wikipedia'
require 'continuation'

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

# 			url_end = row.css('a').first.attributes['href'].value
# 			next if url_end =~ /redlink=1/i
# 			war_link = wikipedia_base_url + url_end

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



# # #FLAGS
# all_flags = Topic.create(title: "Flags", description: "As many flags as we could find")

# flag_topics = []
# flag_topics << Topic.create(title: "National Flags", description: "Flags from the nations of the world")


# flag_set_urls = ['https://en.wikipedia.org/wiki/Gallery_of_sovereign_state_flags']
# flag_url_collections = [[]]

# flag_set_urls.each do |url|
# 	web = Nokogiri::HTML(open(url))
# 	web.css('#bodyContent').css('#mw-content-text').css('table').each do |tab|
# 		url_end = tab.css('tr').css('td').css('a')[1]['href']
# 		next if url_end =~ /redlink=1/i
# 		flag_url_collections[flag_set_urls.index(url)] << url_end
# 		break if url_end == '/wiki/Flag_of_Transnistria'
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



# # #US PRESIDENTS
# us_presidents = Topic.create(title: 'US Presidents', description: 'All the presidents of the United States')

# all_pres_page = 'https://en.wikipedia.org/wiki/List_of_Presidents_of_the_United_States'
# pres_url_ends = []

# pres_web = Nokogiri::HTML(open(all_pres_page))
# pres_web.css('table.wikitable').css('tr').css('big').css('a').each do |pres_link|
# 	url_end = pres_link.attributes['href'].value
# 	next if url_end =~ /redlink=1/i
# 	pres_url_ends << url_end
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


# # #COLORS
# # colors = Topic.create(title: 'Colors', description: 'Lots of different colors')

# # color_vals = []

# # (0..255).each do |a|
# # 	(0..255).each do |b|
# # 		(0..255).each do |c|

# # 		end
# # 	end
# # end


# #PROGRAMMING LANGUAGES
# prog_langs = Topic.create(title: 'Programming Languages', description: 'Likely all of the programming languages known to man')

# prog_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_programming_languages'))
# prog_url_ends = []

# prog_list_web.css('div.div-col.columns.column-count.column-count-2').css('li').css('a').each do |i|
# 	url_end = i.attributes['href'].value
# 	next if url_end =~ /redlink=1/i or url_end == '/wiki/A%2B_(programming_language)' or url_end == '/wiki/Visual_J%2B%2B' or url_end == '/wiki/Visual_J'
# 	prog_url_ends << url_end
# end

# prog_url_ends.each do |url_end|
# 	full_url = wikipedia_base_url + url_end
# 	prog_page = Wikipedia.find(url_end)
# 	title = prog_page.title
# 	img_url = prog_page.main_image_url
# 	description = prog_page.summary
# 	prog_lang = Item.create(title: title, link: full_url, image_url: img_url, description: description)
# 	JoinItemTopic.create(item: prog_lang, topic: prog_langs)
# end




# #DOG BREEDS
# dogs = Topic.create(title: 'Dog Breeds', description: 'Lots of breeds of dogs')

# dog_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_dog_breeds'))
# dog_url_ends = []

# table = dog_list_web.css('table').first.css('tr')
# table.shift
# table.pop
# table.each do |row|
# 	url_end = row.css('td').first.css('a').first.attributes['href'].value
# 	next if url_end =~ /redlink=1/i
# 	dog_url_ends << url_end
# end

# dog_url_ends.each do |url_end|
# 	full_url = wikipedia_base_url + url_end
# 	page = Wikipedia.find(full_url)
# 	title = page.title
# 	img_url = page.main_image_url
# 	description = page.summary
# 	dog = Item.create(title: title, link: full_url, image_url: img_url, description: description)
# 	JoinItemTopic.create(item: dog, topic: dogs)
# end




# #CITIES
# cities = Topic.create(title: 'Cities', description: 'Most somewhat large cities in the world')

# city_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_cities_by_GDP'))
# city_url_ends = []

# table = city_list_web.css('table').first.css('tr')
# table.shift
# table.pop
# table.each do |row|
# 	url_end = row.css('td').first.css('a').first.attributes['href'].value
# 	next if url_end =~ /redlink=1/i
# 	city_url_ends << url_end
# end

# city_url_ends.each do |url_end|
# 	full_url = wikipedia_base_url + url_end
# 	page = Wikipedia.find(full_url)
# 	title = page.title
# 	img_url = page.main_image_url
# 	description = page.summary
# 	city = Item.create(title: title, link: full_url, image_url: img_url, description: description)
# 	JoinItemTopic.create(item: city, topic: cities)
# end



# #CONSTELLATIONS
# constellations = Topic.create(title: 'Modern Constellations', description: '88 modern constellations')

# const_list_web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/88_modern_constellations'))
# const_url_ends = []

# const_list_web.css('.navbox').first.css('tr')[1].css('li').css('a').each do |le|
# 	url_end = le['href']
# 	next if url_end =~ /redlink=1/i
# 	const_url_ends << url_end
# end

# const_url_ends.each do |url_end|
# 	full_url = wikipedia_base_url + url_end
# 	page = Wikipedia.find(full_url)
# 	title = page.title
# 	img_url = page.main_image_url
# 	description = page.summary
# 	constellation = Item.create(title: title, link: full_url, image_url: img_url, description: description)
# 	JoinItemTopic.create(item: constellation, topic: constellations)
# end



#PHILOSOPHERS
all_phil = Topic.create(title: 'Philosophers', description: 'All known and important philosophers from around the world')
regional_phils = [Topic.create(title: 'Eastern Philosophers', description: 'All known and important eastern philosophers'), Topic.create(title: 'Western Philosophers', description: 'All known and important western philosophers')]
phil_url_ends = [[],[]]

ep_web = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Timeline_of_Eastern_philosophers"))
i = 0
callcc do |done|
	ep_web.css('.mw-parser-output').css('ul').each do |ul|
		i += 1
		next if i < 15
		ul.css('li').each do |li|
			if li.css('a').first
				url_end = li.css('a').first['href']
				next if url_end =~ /redlink=1/i
				phil_url_ends[0] << url_end
				done.call if url_end == '/wiki/Jamg%C3%B6n_Ju_Mipham'
			end
		end
	end
end

wp_web = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/Timeline_of_Western_philosophers"))
i = 0
callcc do |done|
	wp_web.css('.mw-parser-output').css('ul').each do |ul|
		i += 1
		next if i < 9
		ul.css('li').each do |li|
			if li.css('a').first
				url_end = li.css('a').first['href']
				next if url_end =~ /redlink=1/i
				phil_url_ends[1] << url_end
				done.call if url_end == '/wiki/Alexander_Wendt'
			end
		end
	end
end

(0..1).each do |i|
	phil_url_ends[i].each do |url_end|
		full_url = wikipedia_base_url + url_end
		page = Wikipedia.find(full_url)
		title = page.title
		img_url = page.main_image_url
		description = page.summary
		philo = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: philo, topic: all_phil)
		JoinItemTopic.create(item: philo, topic: regional_phils[i])
	end
end




#UNSOLVED PROBLEMS
all_unsolved = Topic.create(title: 'Unsolved Problems', description: 'Unsolved problems in various fields of study')
unsolved_fields = []
['Biology', 'Neuroscience', 'Chemistry', 'Computer Science', 'Economics', 'Geoscience', 'Information Theory', 'Linguistics', 'Mathematics', 'Medicine', 'Physics', 'Statistics'].each do |field|
	unsolved_fields << Topic.create(title: "Unsolved Problems in #{field}", description: "Unsolved problems in #{field}")
end

url_ends_by_field = []
unsolved_fields.count.times do 
	url_ends_by_field << []
end

	#biology
web = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_biology"))
web.css('table.wikitable').first.css('tr').each do |row|
	if row.css('td').first.css('a').first
		url_end = row.css('td').first.css('a').first['href']
		next if url_end =~ /redlink=1/i

		full_url = wikipedia_base_url + url_end
		title = row.css('td').first.text
		description = row.css('td')[1].text
		img_url = Wikipedia.find(full_url).main_image_url

		problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: problem, topic: all_unsolved)
		JoinItemTopic.create(item: problem, topic: unsolved_fields[0])
	end
end

	#neuroscience
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_neuroscience'))
web.css('ul')[1].css('li').each do |item|
	url_end = nil
	url_end = item.css('a').first.attributes['href'].value if item.css('a').first
	next if url_end =~ /redlink=1/i
	full_url = url_end ? wikipedia_base_url + url_end : nil
	img_url = Wikipedia.find(full_url).main_image_url if full_url

	title = item.text[/.+?(?=:)/]
	description = item.text[/(?<=:).*/]

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[1])
end

	#chemistry
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_chemistry'))
web.css('ul')[1..2].css('li').each do |item|
	url_end = nil
	url_end = item.css('a').first.attributes['href'].value if item.css('a').first
	next if url_end =~ /redlink=1/i
	full_url = url_end ? wikipedia_base_url + url_end : nil
	img_url = Wikipedia.find(full_url).main_image_url if full_url

	title = 'untitled'
	description = item.text

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[2])
end
web.css('ul')[3].css('li').each do |item|
	url_end = nil
	url_end = item.css('a').first.attributes['href'].value if item.css('a').first
	next if url_end =~ /redlink=1/i
	full_url = url_end ? wikipedia_base_url + url_end : nil
	img_url = Wikipedia.find(full_url).main_image_url if full_url

	title = item.text[/.+?(?=:)/]
	description = item.text[/(?<=:).*/]

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[2])
end

	#computer science
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_computer_science'))
web.css('ul')[1..2].css('li').each do |item|
	url_end = nil
	full_url = nil
	img_url = nil
	description = nil
	if item.css('a').first
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i
			full_url = wikipedia_base_url + url_end
			page = Wikipedia.find(full_url)
			img_url = page.main_image_url
			description = page.summary
		end
	end
	title = item.text

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[3])
end
web.css('ul')[3..4].css('li').each do |item|
	url_end = nil
	full_url = nil
	title = nil
	img_url = nil
	if item.css('a').first
		title = item.css('a').first.attributes['title'].value
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i
			full_url = wikipedia_base_url + url_end
			page = Wikipedia.find(full_url)
			img_url = page.main_image_url
		end
	end
	description = item.text

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[3])
end
web.css('ul')[5..6].css('li').each do |item|
	url_end = nil
	description = nil
	img_url = nil
	url_end = item.css('a').first.attributes['href'].value if item.css('a').first
	full_url = (url_end and !(url_end =~ /redlink=1/i)) ? wikipedia_base_url + url_end : nil
	if full_url
		page = Wikipedia.find(full_url)
		description = page.summary
		img_url = page.main_image_url
	end
	title = item.text

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[3])
end



	#economics
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_economics'))
web.css('ul')[1..3].css('li').each do |item|
	full_url = nil
	img_url = nil
	if item.css('a').first
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
			full_url = wikipedia_base_url + url_end
			img_url = Wikipedia.find(full_url).main_image_url
		end
	end
	title = item.text[/.+?(?=:)/]
	description = item.text[/(?<=:).*/]

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[4])
end


	#geoscience
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_geoscience'))
web.css('ul')[1..2].css('li').each do |item|
	full_url = nil
	img_url = nil
	if item.css('a').first
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
			full_url = wikipedia_base_url + url_end
			img_url = Wikipedia.find(full_url).main_image_url
		end
	end

	title = 'untitled'
	description = item.text

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[5])
end


	#information theory
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_information_theory'))
web.css('ul')[0..1].css('li').each do |item|
	full_url = nil
	img_url = nil
	if item.css('a').first
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
			full_url = wikipedia_base_url + url_end
			img_url = Wikipedia.find(full_url).main_image_url
		end
	end

	title = item.text[/.+?(?=:)/]
	description = item.text[/(?<=:).*/]

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[6])
end


# 	#linguistics
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_linguistics'))
(web.css('ul')[10..12]  + web.css('ul')[14..19]).each do |list|
	list.css('li').each do |item|
		full_url = nil
		img_url = nil
		if item.css('a').first
			url_end = item.css('a').first.attributes['href'].value
			unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
				full_url = wikipedia_base_url + url_end
				img_url = Wikipedia.find(full_url).main_image_url
			end
		end
		title = 'untitled'
		description = item.text 

		problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: problem, topic: all_unsolved)
		JoinItemTopic.create(item: problem, topic: unsolved_fields[7])
	end
end

#	mathematics
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_mathematics'))
(web.css('ul')[6..9] + web.css('ul')[11..12]).each do |list|
	list.css('li').each do |item|
		full_url = nil
		img_url = nil
		description = nil
		if item.css('a').first
			url_end = item.css('a').first.attributes['href'].value
			unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
				full_url = wikipedia_base_url + url_end
				page = Wikipedia.find(full_url)
				img_url = page.main_image_url
				description = page.summary
			end
		end
		title = item.text

		problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: problem, topic: all_unsolved)
		JoinItemTopic.create(item: problem, topic: unsolved_fields[8])
	end
end
list_of_lists = web.css('ul')[13..14] + web.css('ul')[16..28] + web.css('ul')[34..37]
list_of_lists << web.css('ul')[10]
list_of_lists.each do |list|
	list.css('li').each do |item|
		full_url = nil
		img_url = nil
		title = 'untitled'
		if item.css('a').first
			url_end = item.css('a').first.attributes['href'].value
			title = item.css('a').first.attributes['title'].value unless url_end =~ /cite-note/i or url_end =~ /cite_note/i
			unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
				full_url = wikipedia_base_url + url_end
				img_url = Wikipedia.find(full_url).main_image_url
			end
		end
		description = item.text

		problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: problem, topic: all_unsolved)
		JoinItemTopic.create(item: problem, topic: unsolved_fields[8])
	end
end
web.css('ul')[15].css('li').each do |item|
	full_url = nil
	img_url = nil
	title = 'untitled'
	if item.css('a').first
		title = item.css('a').first.attributes['title'].value
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
			full_url = wikipedia_base_url + url_end
			img_url = Wikipedia.find(full_url).main_image_url
		end
	end
	description = item.text[/(?<=\().*.+?(?=\))/]

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[8])
end


	#medicine
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_medicine'))
web.css('ul').first.css('li').each do |item|
	full_url = nil
	img_url = nil
	if item.css('a').first
		url_end = item.css('a').first.attributes['href'].value
		unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
			full_url = wikipedia_base_url + url_end
			page = Wikipedia.find(full_url)
			img_url = page.main_image_url
			description = page.summary
		end
	end
	title = item.text

	problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
	JoinItemTopic.create(item: problem, topic: all_unsolved)
	JoinItemTopic.create(item: problem, topic: unsolved_fields[9])
end


	#physics
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_physics'))
web.css('ul')[2..14].each do |list|
	list.css('li').each do |item|
		full_url = nil
		img_url = nil
		title = 'untitled'
		if item.css('a').first
			url_end = item.css('a').first.attributes['href'].value
			title = item.css('a').first.attributes['title'].value unless url_end =~ /cite-note/i or url_end =~ /cite_note/i
			unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
				full_url = wikipedia_base_url + url_end
				img_url = Wikipedia.find(full_url).main_image_url
			end
		end
		description = item.text

		problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: problem, topic: all_unsolved)
		JoinItemTopic.create(item: problem, topic: unsolved_fields[10])
	end
end


	#statistics
web = Nokogiri::HTML(open('https://en.wikipedia.org/wiki/List_of_unsolved_problems_in_statistics'))
web.css('ul')[1..2].each do |list|
	list.css('li').each do |item|
		full_url = nil
		img_url = nil
		title = 'untitled'
		if item.css('a').first
			url_end = item.css('a').first.attributes['href'].value
			title = item.css('a').first.attributes['title'].value unless url_end =~ /cite-note/i or url_end =~ /cite_note/i
			unless url_end =~ /redlink=1/i or url_end =~ /cite-note/i or url_end =~ /cite_note/i
				full_url = wikipedia_base_url + url_end
				img_url = Wikipedia.find(full_url).main_image_url
			end
		end
		description = item.text

		problem = Item.create(title: title, link: full_url, image_url: img_url, description: description)
		JoinItemTopic.create(item: problem, topic: all_unsolved)
		JoinItemTopic.create(item: problem, topic: unsolved_fields[11])
	end
end

