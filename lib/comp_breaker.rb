
class CompCodeBreak
  attr_accessor :comp_move, :total_code, :comp_code, :total_code
  
  def initialize
    @comp_move = [1,1,2,2]
    @total_code = []
    (1111..6666).each {|num| @total_code << num if num.to_s.match(/^[1-6]{4}$/)}
    @comp_set = @total_code.dup.uniq
    super
  end

  def guess_array(string)
    string.chars.map(&:to_i)
  end

  def computer_move
   @comp_move = @comp_set.shift.to_s.chars.map(&:to_i)
  end
     
  def player_code_get
    puts display_player_enter_code
    @player_secret_code = gets.chomp
  end
    
  def player_code_array
    guess_array(@player_secret_code)
  end 

  def comp_peg_hint(move)
    peg_hint(player_code_array, move)
  end



  def comp_code_cull 
    comp_pegs = comp_peg_hint(@comp_move)
    @comp_set.each do |nums| 
      if comp_peg_hint(nums.to_s.chars.map(&:to_i)) != comp_pegs
        @comp_set.delete(nums)
      end
    
    end

  end

  def comp_winner?
    @comp_move == @player_secret_code
  end
end

