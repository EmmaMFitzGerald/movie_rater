class MovieRater::CLI 
  
  def call 
    list_genres
    pick_genre
    goodbye
  end 

  def list_genres
    puts "Top Rated Movies"
    @movies = MovieRater::Movie.today
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie}"
    end
  end 
  
  def pick_genre
    puts "Enter the movie you would like to see the ratings of, type list to see the list of movies or type exit:"
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
    if input.to_i > 0 
      the_movie = @movies[input.to_i-1]
      puts "The movie: #{the_movie.title}, in the #{the_movie.genre} genre, has a rating of #{the_movie.rating}. It was made in #{the_movie.release_year}."
    elsif input == "list"
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