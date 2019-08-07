class MovieRater::CLI 
  
  def call 
    puts "Today's Top Movies"
    list_genres
  end 

  def list_genres
    puts <<-DOC
      1. Action
      2. Adventure
      3. Animation
      4. Biography
    DOC
  end 
    
end