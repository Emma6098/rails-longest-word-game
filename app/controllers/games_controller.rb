require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters.push(('a'..'z').to_a[rand(26)])
    end
    @letters
  end
  def score
    @word = params[:player_word]
    @letters = params[:grid]
  end

  def valid_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    result = JSON.parse(URI.open(url).read)

    if result['found'] == true
      true
    else
      false
    end
  end

  def in_grid?(word, grid)

  end

  if valid_word(@word) && in_grid(@word, @letters)
    'Congratulation! DUNE is a valid English word!'
  elsif valid_word == false
    "Sorry but #{@word.capitalize} does not seem to be a valid English word..."
  else
    "Sorry but #{@word.capitalize} can't be build out of #{@letters}"
  end
end
