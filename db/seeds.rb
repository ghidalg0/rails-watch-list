# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

puts 'Creating movies...'

url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movie = JSON.parse(movie_serialized)["results"]

movie.each do |m|
  Movie.create(
    title: m["original_title"],
    overview: m["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{m['poster_path']}",
    rating: m["vote_average"]
  )
end

puts 'Finished!'
