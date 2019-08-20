require 'open-uri'
require 'pry'
require 'nokogiri'


class Movie::Movie
  attr_accessor :title, :bio, :rating, :certificate, :genre, :url

  @@all = []

  def initialize(title, bio, rating, certificate, genre, url)
    @title = title
    @bio = bio
    @rating = rating 
    @certificate = certificate
    @genre = genre
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
  

  def self.new_from_index_page(m)
   #html = open('https://www.imdb.com/search/title/?groups=top_250&sort=user_rating')
   #doc = Nokogiri::HTML(html)
   #cards = doc.css('div.lister-item.mode-advanced').each do |movie_card|
    title = m.css('h3 a').text
    bio = m.css('p.text-muted')[1].text.strip
    certificate = m.css('span.certificate').text.strip
    genre = m.css('span.genre').text.strip
    rating = m.css('strong').text.strip
    url = m.css('h3 a').attr('href')
    new(title, bio, rating, certificate, genre, url)
   end
end

