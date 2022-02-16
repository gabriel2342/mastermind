# frozen_string_literal: true

require_relative 'display'
require_relative 'comp_breaker'

class Gameplay < CompCodeBreak
  include Display

  def initialize; end

  def validate_player_guess; end

  def peg_hint(code, guess_array)
    @matches = []
    @partials_count = 0
    player_guess = guess_array.clone
    move = code.clone

    guess_array.each_with_index do |num, i|
      if num == code[i]
        @matches << num
        move.delete_at(move.index(num) || move.length)
        player_guess.delete_at(player_guess.index(num)|| player_guess.length)
      end
    end
  
    player_guess.each do |num|
      if move.include?(num) 
        @partials_count +=1 
        move.delete_at(move.index(num || move.length))
      end
    end

    display_matches_and_partials(@matches.size, @partials_count)
    @peg_array = [@matches.size, @partials_count]
  end
end
