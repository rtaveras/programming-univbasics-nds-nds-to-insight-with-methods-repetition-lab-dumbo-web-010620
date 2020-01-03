$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end


def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end


def list_of_directors(source)
  directors = []
  i = 0 
  while i < source.length do
    directors << source[i][:name]
    i += 1 
  end
  return directors
end


def total_gross(source)
  director_names_and_totals = directors_totals(source)
  gross = 0 
  director_names_and_totals.each do |name,totals|
    gross += totals
  end
  return gross
end

