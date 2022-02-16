# frozen_string_literal: true

require_relative 'display'
require_relative 'gameplay'

MAX_GUESS = 12

class MasterMind < Gameplay
  include Display

  def initialize; end

  def secret_code
    # @comp_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
    @comp_code = [1, 2, 3, 4]
  end

  def game_type_choice
    puts display_player_choice
    @play_choice = gets.chomp
  end

  

  def player_guess
    puts display_enter_guess
    @player_guess = gets.chomp
    @player_guess_array = guess_array(@player_guess)
  end

  def winner?(guess)
    @comp_code.join.to_i == guess.to_i
  end

  def play_game
    game_type_choice
    if @play_choice == 'breaker'
      counter = MAX_GUESS
      MAX_GUESS.times do 
        player_guess
        peg_hint(@comp_code, @player_guess_array)
        
        counter -= 1

        if winner?(@player_guess)
          puts display_chicken
          break
        elsif counter == 0
          puts display_womp_womp
          break
        end

        puts display_guesses_remaining(counter)
      end
    elsif @play_choice == 'maker'
      player_code_get
      first_move
      comp_peg_hint
    end
  end


  

end

game = MasterMind.new
p game.secret_code
game.play_game
