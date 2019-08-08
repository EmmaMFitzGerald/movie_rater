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
end


class CLI
  def start
    puts "Welcome. Do you want to see the movie list? Y/N"
    input = gets.strip
    

    case input.downcase
      when 'y'
        list_movies
        find_info
      when 'n'
        exit
      end
    end
  end


  def list_movies

    Movie.all.each.with_index(1) do |m, i|

      puts "#{i}. #{m.title}"

  end
  
  def find_info
    puts "Type a number to get more info about that movie"
    input = gets.strip.to_i

    display_details(input)
    
    puts "Would you like to check another movie? Y/N"
    input = gets.strip
    
    if input.downcase == "y"
      list_movies
      find_info
    elsif input.downcase == "n"
      exit
    else 
      exit
    end
  end

  def display_details(input)
    movie = Movie.all[input - 1]
    
    puts "You chose: #{movie.title}, number #{input} on the list. IMDB have rated this movie with #{movie.rating} stars. In summary, this movie is about #{movie.bio} It is a #{movie.genre} movie and is rated #{movie.certificate}. "
  end
end
  
#scraper
html = open('https://www.imdb.com/search/title/?groups=top_250&sort=user_rating')
doc = Nokogiri::HTML(html)
cards = doc.css('div.lister-item.mode-advanced').each do |movie_card|
  title = movie_card.css('h3 a').text
  bio = movie_card.css('p.text-muted')[1].text.strip
  certificate = movie_card.css('span.certificate').text.strip
  genre = movie_card.css('span.genre').text.strip
  rating = movie_card.css('strong').text.strip
  Movie.new(title, bio, rating, certificate, genre)
end

CLI.new.start