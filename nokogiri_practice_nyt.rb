require 'open-uri'
require 'nokogiri'
require 'sinatra'

browser = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4)
AppleWebKit/536.30.1 (KHTML, like Gecko) Version/6.0.5 Safari/536.30.1'

doc = Nokogiri::HTML(open ('http://nytimes.com', browser))

nyt_headline = doc.at_css('h2 span').content

nyt_url = "http://nytimes.com" + doc.at_css('.css-16ugw5f a')[:href]


html = "<h1>Nokogiri News Service</h1>"
html += "<h2>Top Story: <a href=\"#{nyt_url}\">#{nyt_headline}</a></h2>"

get '/' do
    html
end
