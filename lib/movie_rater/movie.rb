require 'open-uri'
require 'pry'
require 'nokogiri'


class Movie::Movie
  attr_accessor :title, :bio, :rating, :certificate, :genre

  @@all = []

  def initialize(title, bio, rating, certificate, genre)
    @title = title
    @bio = bio
    @rating = rating 
    @certificate = certificate
    @genre = genre
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_index_page(movie)
   #html = open('https://www.imdb.com/search/title/?groups=top_250&sort=user_rating')
   #doc = Nokogiri::HTML(html)
   #cards = doc.css('div.lister-item.mode-advanced').each do |movie_card|
    title = movie_card.css('h3 a').text
    bio = movie_card.css('p.text-muted')[1].text.strip
    certificate = movie_card.css('span.certificate').text.strip
    genre = movie_card.css('span.genre').text.strip
    rating = movie_card.css('strong').text.strip
    new(title, bio, rating, certificate, genre)
   end
end

