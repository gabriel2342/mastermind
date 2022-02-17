# frozen_string_literal: true

class CompCodeBreak
  attr_accessor :comp_move, :total_code, :comp_code, :comp_guess

  def initialize
    @comp_move = [1, 1, 2, 2]
    @total_code = []
    (1111..6666).each { |num| @total_code << num if num.to_s.match(/^[1-6]{4}$/) }
    total_code.unshift(1122)
    @comp_set = @total_code.dup.uniq
    super
  end


  def player_code_array
    make_array(@player_secret_code)
  end

  def player_code_get
    puts display_player_enter_code
    @player_secret_code = gets.chomp
  end
  
  def make_array(string)
    string.chars.map(&:to_i)
  end

  def comp_peg_hint(move)
    peg_hint(player_code_array, move)
  end

  def comp_code_cull  
    10.times do 
      @comp_guess = make_array(@comp_set.shift.to_s)
      break if @comp_guess == player_code_array
      p @comp_guess
      @comp_set = @comp_set.reject do |digits| 
        comp_peg_hint(make_array(digits.to_s)) != comp_peg_hint(@comp_guess)
      end
    end
    @comp_guess
  end

  
end
