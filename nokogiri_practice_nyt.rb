require 'open-uri'
require 'nokogiri'
require 'sinatra'

doc = Nokogiri::HTML(open 'http://nytimes.com')

nyt_headline = doc.at_css('h2 span').content

nyt_url = "http://nytimes.com" + doc.at_css('.css-16ugw5f a')[:href]

html = "<h1>Nokogiri News Service</h1>"
html += "<h2>Top Story: <a href=\"#{nyt_url}\">#{nyt_headline}</a></h2>"

get '/' do
      html
end
