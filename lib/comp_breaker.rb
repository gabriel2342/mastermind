# frozen_string_literal: true

class CompCodeBreak
  attr_accessor :comp_move, :total_code, :comp_code

  def initialize
    @comp_move = [1, 1, 2, 2]
    @total_code = []
    (1111..6666).each { |num| @total_code << num if num.to_s.match(/^[1-6]{4}$/) }
    total_code.unshift(1122)
    @comp_set = @total_code.dup.uniq
    super
  end


  def player_code_array
    guess_array(@player_secret_code)
  end

  def player_code_get
    puts display_player_enter_code
    @player_secret_code = gets.chomp
  end
  
  def guess_array(string)
    string.chars.map(&:to_i)
  end

  def comp_peg_hint(move)
    peg_hint(player_code_array, move)
  end

  def comp_code_cull
    comp_guess = @comp_set[0].to_s.chars.map(&:to_i)
    @comp_set.delete_at(0)
    @comp_set.each do |digits|
      @comp_set.delete(digits) if comp_peg_hint(guess_array(digits.to_s)) != comp_peg_hint(comp_guess)
    end
  end

  def comp_winner?
    @comp_move == @player_secret_code
  end
end
