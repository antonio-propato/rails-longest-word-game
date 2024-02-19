require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    input = params[:input]

    word = URI.open("https://wagon-dictionary.herokuapp.com/#{input}")
    final_word = JSON.parse(word.read)

    if final_word["found"]
      @answer = "Congratulations! #{input.upcase} is a valid English word"
    else
      @answer = "Sorry but #{input.upcase} doesn't seem to be an English word"
    end
  end
end
