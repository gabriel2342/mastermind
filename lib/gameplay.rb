# frozen_string_literal: true

require_relative 'display'

#This class creates the hints for the player or computer
class GamePlay 
  include Display
  attr_reader :matches, :partials_count

  def initialize
    @matches = []
    @partials_count = 0
    super
  end
  
  def validate_code(code)
    return true if code.size == 4 && code =~ /\A\d+\z/ 
    false
  end

  def delete_element(ele, number)
    ele.delete_at(ele.index(number) || ele.length)
  end


  def matches(guess, play_guess, code, mov)
    guess.each_with_index do |num, index|
      next unless num == code[index]
      @matches << num
      delete_element(mov, num)      
      delete_element(play_guess, num)
    end
  end

  def partials(guess, mov)
    guess.each do |num|
      if mov.include?(num)
        @partials_count += 1
        delete_element(mov, num)
      end
    end
  end

  def peg_hint(code_array, guess_arr)
    @matches = []
    @partials_count = 0
    player_guess = guess_arr.clone
    move = code_array.clone

    matches(guess_arr, player_guess, code_array, move)
    partials(player_guess, move)
    
    [@matches.size, @partials_count]
  end

end
