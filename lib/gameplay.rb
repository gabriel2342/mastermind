# frozen_string_literal: true

require_relative 'display'
require_relative 'comp_breaker'

class Gameplay < CompCodeBreak
  include Display
  attr_accessor :matches, :partials_count

  def initialize
    @matches = []
    @partials_count = 0
    super
  end

  def validate_player_guess; end

  def peg_hint(code, guess_array)
    @matches = []
    @partials_count = 0
    player_guess = guess_array.clone
    move = code.clone

    guess_array.each_with_index do |num, i|
      next unless num == code[i]

      @matches << num
      move.delete_at(move.index(num) || move.length)
      player_guess.delete_at(player_guess.index(num) || player_guess.length)
    end

    player_guess.each do |num|
      if move.include?(num)
        @partials_count += 1
        move.delete_at(move.index(num || move.length))
      end
    end

    [@matches.size, @partials_count]
  end
end
