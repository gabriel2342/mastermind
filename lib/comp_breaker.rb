# frozen_string_literal: true

require_relative 'player_breaker'

#This class manages the computer code breaking process when player chooses to be the code maker.
class CompCodeBreak < PlayerCodeBreak
  attr_reader :comp_move,  :comp_code, :comp_guess, :comp_set, :player_secret_code

  def initialize
    @comp_move = [1, 1, 2, 2]
    total_code = []
    (1111..6666).each { |num| total_code << num if num.to_s.match(/^[1-6]{4}$/) }
    total_code.unshift(1122)
    @comp_set = total_code.dup.uniq
    @comp_guess = []
    @player_secret_code = ""
    super
  end

  def player_code_array
    make_array(@player_secret_code)
  end

  def player_code_get
    puts display_player_enter_code
    @player_secret_code = gets.chomp
  end

  def comp_peg_hint(move)
    peg_hint(player_code_array, move)
  end

  def computer_guess 
    @comp_guess = make_array(@comp_set.shift.to_s)
    puts display_computer_guessed(@comp_guess.join(''))
  end

  def comp_set_cull(set,guess)
    set.select do |digits|
      peg_hint(guess, make_array(digits.to_s)) == comp_peg_hint(guess)
    end
  end

  def comp_code_cull
    loop do
     computer_guess
      break if @comp_guess == player_code_array
      @comp_set = comp_set_cull(@comp_set, @comp_guess)
    end
    puts display_computer_won(@comp_guess.join(''))
  end
end
