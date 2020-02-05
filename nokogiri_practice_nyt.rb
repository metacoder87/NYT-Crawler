require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(open 'http://nytimes.com')

nyt_headline = doc.at_css('h2 span').content

nyt_url = "http://nytimes.com" + doc.at_css('.css-16ugw5f a')[:href]
