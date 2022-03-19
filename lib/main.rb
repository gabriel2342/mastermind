# frozen_string_literal: true

require_relative 'comp_breaker'

#Class where the main gameplay is managed.
class MasterMind < CompCodeBreak


  def game_type_choice
    display_banner
    display_player_choice
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

play_again = ''
game = MasterMind.new
game.secret_code
until play_again == 'no'
  game.play_game
  puts "\n==> Would you like to play another game?"
  print "==> Type 'no' to exit or 'yes' to continue: "
  play_again = gets.chomp.downcase
end
puts "==> Thanks for playing! Goodbye."
