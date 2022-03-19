# frozen_string_literal: true

require_relative 'gameplay'

MAX_GUESS = 12

# Manages the player as codebreaker gameplay
class PlayerCodeBreak < GamePlay
  attr_reader :play_choice, :player_code_guess, :player_guess_array

  def initialize
    @play_choice = ''
    @player_code_guess = ''
    @player_guess_array = []
    @comp_code = []
    super
  end

  def player_guess
    puts display_enter_guess
    @player_code_guess = gets.chomp
    until validate_code(@player_code_guess)
      puts "\n==> WARNING: Your code must be 4 integers."
      puts display_enter_guess
      @player_code_guess = gets.chomp
    end
    @player_guess_array = make_array(@player_code_guess)
  end

  def secret_code
    @comp_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
  end

  def winner?(guess)
    @comp_code.join.to_i == guess.to_i
  end

  def result(player_guess, count)
    if winner?(player_guess)
      puts display_chicken
      'won'
    elsif count.zero?
      puts display_womp_womp
      'lost'
    else
      false
    end
  end

  def player_peg_hint
    hint = peg_hint(@comp_code, @player_guess_array)
    display_matches_and_partials(hint[0], hint[1]) 
  end

  def player_guess_and_hint(count)
    player_guess
    player_peg_hint
    puts display_guesses_remaining(count) unless count.zero?
  end

  def player_code_break
    counter = MAX_GUESS
    MAX_GUESS.times do
      counter -= 1
      player_guess_and_hint(counter)
      break if result(@player_code_guess, counter) != false
    end
  end
end


































