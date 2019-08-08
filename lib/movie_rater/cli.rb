class MovieRater::CLI 
  
  def call 
    list_movies
    pick_movie
    goodbye
  end 

  def list_movies
    puts "These are the top 10 rated movies of all time according to IMDB:"
    #list top ten movies
    @movies = MovieRater::Movie.new
    @movies.each.with_index(1) do |movie, i|
      puts "#{i}. #{movie}"
    end
  end 
  
  def pick_movie
    puts "Enter the movie you would like to see more information on, type list to see the list of movies again or type exit:"
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
    if input.to_i > 0 
      the_movie = @movies[input.to_i-1]
      puts "The movie: #{the_movie.title}, in the #{the_movie.genre} genre, has a rating of #{the_movie.rating}. It was made in #{the_movie.release_year}."
    elsif input == "list"
        list_genres
    elsif input.to_i > 10 
      puts "Please pick a movie in the top 10"
    else
        puts "I don't understand that command"
     end
   end
  end
  
  def goodbye
    puts "Goodbye, see you soon"
  end
    
end