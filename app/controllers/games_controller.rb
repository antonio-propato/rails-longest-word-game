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
      @answer = "Congratulations! #{input} is a correct word"
    else
      @answer = "Wrong"
    end
  end
end
