# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = 'http://1000mostcommonwords.com/1000-most-common-german-words/'

page = Nokogiri::HTML(open(url))

dictionary = page.css('#post-188 > div > table > tbody > tr')

dictionary.each do |t|
  Card.create(original_text: t.css('td')[1].text, translated_text: t.css('td')[2].text, review_date: 3.days.from_now)
end
