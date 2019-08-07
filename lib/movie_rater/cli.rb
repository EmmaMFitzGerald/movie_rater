class MovieRater::CLI 
  
  def call 
    list_genres
    pick_genre
    goodbye
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
    puts "Enter the genre you would like to see the ratings of or type exit:"
    input = nil 
    while input != "exit"
    input = gets.strip.downcase
    case input 
      when "1"
        puts "More info on Action"
      when "2"
        puts "More info on Adventure"
     end
   end
  end
  
  def goodbye
    puts "Goodbye, see you soon"
  end
    
end