URI.open("http://tmdb.lewagon.com/movie/top_rated") do |lines|
  lines.each_line do |line|
    results = JSON.parse(line)
    results["results"].each_with_index do |result, index|
      if result["original_language"] == 'en'
        # title, vote_average, overview, poster_url
        image = "https://image.tmdb.org/t/p/original#{result["poster_path"]}"
        Movie.create(
          title: result["title"],
          rating: result["vote_average"],
          overview: result["overview"],
          poster_url: image
        )
      end
    end
  end
end
