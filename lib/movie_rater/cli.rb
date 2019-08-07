class MovieRater::CLI 
  
  def call 
    list_genres
    pick_genre
    goodbye
  end 

  def list_genres
    puts "Top Rated Movies"
    @movie = MovieRater::Movie.today
  end 
  
  def pick_genre
    puts "Enter the movie you would like to see the ratings of, type list to see the list of movies or type exit:"
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
    case input 
      when "1"
        puts "More info on movie 1"
      when "2"
        puts "More info on movie 1"
      when "list"
        list_genres
      else 
        puts "I don't understand that command"
     end
   end
  end
  
  def goodbye
    puts "Goodbye, see you soon"
  end
    
end