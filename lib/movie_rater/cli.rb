class MovieRater::CLI 
  
  def call 
    puts "Today's Top Movies"
    list_genres
    pick_genre
  end 

  def list_genres
    puts <<-DOC
      1. Action
      2. Adventure
      3. Animation
      4. Biography
    DOC
  end 
  
  def pick_genre
    puts "Enter the genre you would like to see the ratings of:"
  end
    
end