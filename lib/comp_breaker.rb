
class CompCodeBreak

  def initialize
    @total_code = []
    (1111..6666).each {|num| @total_code << num if num.to_s.match(/^[1-6]{4}$/)}
    @comp_set = @total_code.dup.uniq
    @comp_move = []
    p "comp_move #{@comp_move}"
  end

  def guess_array(string)
    string.chars.map(&:to_i)
  end

  def first_move
    @comp_move = [1,1,2,2]
  end

  def comp_choice
    @comp_set.shift.to_s.chars.map(&:to_i)
  end
     
  def player_code_get
    puts display_player_enter_code
    @player_code = gets.chomp
  end
    
  def comp_peg_hint
    
    p "comp #{@comp_move}"
    p "code #{guess_array(@player_code)}"
    p peg_hint(guess_array(@player_code), @comp_move)
  end

  def comp_code_cull  
  

  end

  def comp_winner?
    @comp_move == @player_code
  end
end

