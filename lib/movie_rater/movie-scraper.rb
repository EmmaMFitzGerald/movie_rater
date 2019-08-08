class MovieRater::Scraper
  
  def get_page
    Nokogiri::HTML(open("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"))
  end

  def scrape_movies_index
    self.get_page.css("div#t1-50 li")
  end

  def make_movies
    scrape_movies_index.each do |r|
    MovieRater::Movie.new_from_index_page(r)
    end
  end
  
end