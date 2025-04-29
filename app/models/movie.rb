class Movie < ApplicationRecord
  has_and_belongs_to_many :genres

  broadcasts_to ->(movie) { "movies" }
end
