require 'open-uri'
require 'pry'
require 'nokogiri'


class Movie
  attr_accessor :title, :bio

  @@all = []

  def initialize(title, bio)
    @title = title
    @bio = bio
    @@all << self
  end

  def self.all
    @@all
  end
end


class CLI
  def start
    puts "welcome. do you want to see the movie list?"
    input = gets.strip
    

    case input.downcase
      when 'yes'
        list_movies
      when 'exit'
        exit
      end
    end
  end


  def list_movies

    Movie.all.each.with_index(1) do |m, i|

      puts "#{i}. #{m.title}"
    end
    puts "type a number to get more info about the movie"
    input = gets.strip.to_i

    display_details(input)

  end

  def display_details(input)
    movie = Movie.all[input - 1]

    puts movie.bio
    puts movie.rating
  end
  
#scraper
html = open('https://www.imdb.com/search/title/?groups=top_250&sort=user_rating')
doc = Nokogiri::HTML(html)
cards = doc.css('div.lister-item.mode-advanced').each do |movie_card|
  title = movie_card.css('h3 a').text
  bio = movie_card.css('p.text-muted')[1].text.strip
  rating = movie_card.css('span.certificate').text.strip
  genre = movie_card.css('span.genre').text.strip
  rating = movie_card.css('strong').text.strip
  binding.pry
  Movie.new(title, bio)
end

CLI.new.start