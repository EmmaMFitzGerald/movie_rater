class MovieRater::CLI 
  
  def call 
    list_genres
    pick_genre
  end 

  def list_genres
    puts "Today's Top Movies"
    puts <<-DOC
      1. Action
      2. Adventure
      3. Animation
      4. Biography
    DOC
  end 
  
  def pick_genre
    puts "Enter the genre you would like to see the ratings of:"
    input = nil 
    input = gets.strip 
    case input 
    when "1"
      puts "More info on Action"
    when "2"
      puts "More info on Adventure"
    end
  end
    
end