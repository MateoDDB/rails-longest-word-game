class GamesController < ApplicationController
  require 'json'

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    require 'json'
    require 'open-uri'
    @word = params[:word]
    @sum = 0
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_words = open(url).read
    user = JSON.parse(user_words)
    @letters = params[:letters].split(' ')
    if user['found']
      @sum += 1
      return @result = "Congratulations! #{@word} is a valid English word!"
    end
    return @sum
    @word.split.each do |lettre|
      if @letters.include?(lettre)
        return @result = "Sorry but #{@word} can't be built out of #{@letters}"
      else
        return @result = "Sorry but #{@word} does not to be a valid English Word"
      end
    end
  end
end
