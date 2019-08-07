class MovieRater::Movie 
  
  attr_accessor :title, :release_year, :genre, :rating
  
  def self.today
    # puts <<-DOC
    #   1. The Shawshank Redemption
    #   2. The Godfather
    #   3. The Dark Knight
    #   4. The Godfather Part 2
    # DOC
    movie_1 = self.new 
    movie_1.title = "The Shawshank Redemption"
    movie_1.release_year = "1994"
    movie_1.genre = "Drama"
    movie_1.rating = "9.3"
    
    movie_2 = self.new 
    movie_2.title = "The Godfather"
    movie_2.release_year = "1972"
    movie_2.genre = "Crime, Drama"
    movie_2.rating = "9.2"
    
    [movie_1, movie_2]
  end
  
end