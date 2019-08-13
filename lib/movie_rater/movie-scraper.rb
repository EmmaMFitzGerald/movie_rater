class Scraper

  def get_page
    Nokogiri::HTML(open('https://www.imdb.com/search/title/?groups=top_250&sort=user_rating'))
  end

  def scrape_movies_index
     self.get_page.css('div.lister-item.mode-advanced')
  end

  def make_movies
    scrape_movies_index.each do |m|
      Movie.new_from_index_page(m)
    end
  end
end

html = open('https://www.imdb.com/search/title/?groups=top_250&sort=user_rating')
doc = Nokogiri::HTML(html)
cards = doc.css('div.lister-item.mode-advanced').each do |movie_card|
  title = movie_card.css('h3 a').text
  bio = movie_card.css('p.text-muted')[1].text.strip
  certificate = movie_card.css('span.certificate').text.strip
  genre = movie_card.css('span.genre').text.strip
  rating = movie_card.css('strong').text.strip
  Movie.new(title, bio, rating, certificate, genre)
end