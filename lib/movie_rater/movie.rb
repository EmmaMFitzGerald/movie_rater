class MovieRater::Movie 
  
  attr_accessor :title, :release_year, :genre, :rating
  
  def self.today
    self.scrape_movies
  end
    # MovieRater::MovieScraper.new
  def scrape_movies
    movies = []
    
    movies << self.scrape_imdb
    # movie_1 = self.new 
    # movie_1.title = "The Shawshank Redemption"
    # movie_1.release_year = "1994"
    # movie_1.genre = "Drama"
    # movie_1.rating = "9.3"
    
    # movie_2 = self.new 
    # movie_2.title = "The Godfather"
    # movie_2.release_year = "1972"
    # movie_2.genre = "Crime, Drama"
    # movie_2.rating = "9.2"
    
    # [movie_1, movie_2]
  end
  
  def self.scrape_imdb
    doc = Nokogiri::HTML(open("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"))
  end
  
end