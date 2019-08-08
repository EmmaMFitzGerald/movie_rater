class MovieRater::Movie 
  
  attr_accessor :title, :release_year, :genre, :rating
  
  @@all = []
  
  def initialize(title=nil, release_year=nil, genre=nil, rating=nil)
    @title = title
    @release_year = release_year
    @genre = genre
    @rating = rating
    @@all << self
  end
    
  def self.all 
    @@all
  end
  
  # def self.today
  #   self.scrape_movies
  # end
   
  def self.find(id)
    self.all[id-1]
  end

  def title
    @title ||= doc.search("div.lister-item-content h3.lister-item-header a").text
  end

  def release_year
    @release_year ||= doc.search("span.lister-item-year").text
  end

  def genre
    @genre ||= doc.search("span.genre").text
  end

  def rating
    @rating ||= doc.search("div.ratings-bar strong").text
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end
   
   
#   #   # MovieRater::MovieScraper.new
#   # def scrape_movies
#   #   movies = []
    
#   #   movies << self.scrape_imdb
#   #   # movie_1 = self.new 
#   #   # movie_1.title = "The Shawshank Redemption"
#   #   # movie_1.release_year = "1994"
#   #   # movie_1.genre = "Drama"
#   #   # movie_1.rating = "9.3"
    
#   #   # movie_2 = self.new 
#   #   # movie_2.title = "The Godfather"
#   #   # movie_2.release_year = "1972"
#   #   # movie_2.genre = "Crime, Drama"
#   #   # movie_2.rating = "9.2"
    
#   #   # [movie_1, movie_2]
#   # end
  
#   # def self.scrape_imdb
#   #   doc = Nokogiri::HTML(open("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"))
#   #   title = doc.search("div.lister-item-content h3.lister-item-header a").text
#   #   release_year = doc.search("span.lister-item-year").text
#   #   genre = doc.search("span.genre").text
#   #   rating = doc.search("div.ratings-bar strong").text
#   #   binding.pry
#   # end
  
# end
end
