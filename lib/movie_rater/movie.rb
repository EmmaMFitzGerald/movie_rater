require 'open-uri'
require 'pry'
require 'nokogiri'


class Movie
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

  def title
    @title ||= movie_card.css('h3 a').text
  end

  def bio
    @bio ||= movie_card.css('p.text-muted')[1].text.strip
  end

  def certificate
    @certificate ||= movie_card.css('span.certificate').text.strip
  end

  def genre
    @genre ||= movie_card.css('span.genre').text.strip
  end

  def rating
    @rating ||= movie_card.css('strong').text.strip
  end
  
  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
end

