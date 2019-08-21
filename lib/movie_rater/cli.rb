class Movie::CLI
  def start
    
    Movie::Scraper.new.make_movies
    
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
    movie = Movie::Movie.all[input - 1]
    display_details(movie, input)
    
    puts "Would you like more information on this movie? Y/N"
    input = gets.strip 
    
    
    if input.downcase == 'y'
      display_awards(movie)
    else
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
  end

  def display_details(movie, input)
    
   
    
    puts "You chose: #{movie.title}, number #{input} on the list. IMDB have rated this movie with #{movie.rating} stars. In summary, this movie is about #{movie.bio} It is a #{movie.genre} movie and is rated #{movie.certificate}." 
  end
  
  def display_awards(movie)
    puts "This movie was #{movie.awards}"
  end 
end