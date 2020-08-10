require "json"

class GamesController < ApplicationController

  # display a new random grid
  # display a form
  # the form is submitted (POST) to the score action
  def new
    range = [*'A'..'Z']
    @letters = Array.new(9){range.sample}
  end

  def score
    @word = params[:score].chars
    @letters = params[:letters].chars # => ["a", "b"]
    response = RestClient.get "https://wagon-dictionary.herokuapp.com/#{@word}"
    @api_response = JSON.parse(response)

    p @letters.sort.join
    p @word.sort.join.upcase

    if @letters != @word
      # que chaque lettre soit inclue dans grid / 1 fois
      @answer = "Sorry but #{@word} cant be built out of #{@letters}"
    elsif @api_response["found"] == false
       @answer = "Sorry but #{@word} does not seem to be a valid English word"
    else
        @answer = "Congratulations! #{@word} is a valid English word!"
    end
  end
end
