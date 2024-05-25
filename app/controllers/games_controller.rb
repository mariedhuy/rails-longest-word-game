require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      alphabet = ('A'..'Z').to_a.sample
      @letters << alphabet
    end
  end

  def score
    word = params[:word]
    word.upcase!
    url = "https://dictionary.lewagon.com/#{word}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)

    if word["found"]
      @message = "#{word["word"]} - Well done !"
    else
      @message = "#{word["word"]} - The word is not in the grid"
    end

    {
      message: @message
    }
  end
end
