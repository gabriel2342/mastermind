# frozen_string_literal: true

require_relative 'comp_breaker'

#Class where the main gameplay is managed.
class MasterMind < CompCodeBreak

  def game_type_choice
    puts display_player_choice
    @play_choice = gets.chomp
  end

  def play_game
    game_type_choice 

    case @play_choice
    when 'breaker'
      player_code_break
    when 'maker'
      player_code_get
      comp_code_cull
    end
  end
end

game = MasterMind.new
p game.secret_code
game.play_game
