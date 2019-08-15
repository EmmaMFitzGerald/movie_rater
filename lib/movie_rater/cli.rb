
class Movie::CLI
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

    Movie::Movie.all.each.with_index(1) do |m, i|

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
    movie = Movie::Movie.all[input - 1]
    
    puts "You chose: #{movie.title}, number #{input} on the list. IMDB have rated this movie with #{movie.rating} stars. In summary, this movie is about #{movie.bio} It is a #{movie.genre} movie and is rated #{movie.certificate}. "
  end
end