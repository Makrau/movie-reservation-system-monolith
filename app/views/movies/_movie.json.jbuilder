json.extract! movie, :id, :title, :description, :poster_image_url, :created_at, :updated_at
json.genres do
  json.array! movie.genres.pluck(:name)
end
json.url movie_url(movie, format: :json)
