# frozen_string_literal: true

module Display

  def display_banner
    puts "\n#     #"                                                                   
    puts "##   ##    ##     ####   #####  ######  #####   #    #  #  #    #  #####"
    puts "# # # #   #  #   #         #    #       #    #  ##  ##  #  ##   #  #    #"
    puts "#  #  #  #    #   ####     #    #####   #    #  # ## #  #  # #  #  #    #"
    puts "#     #  ######       #    #    #       #####   #    #  #  #  # #  #    #"
    puts "#     #  #    #  #    #    #    #       #   #   #    #  #  #   ##  #    #" 
    puts "#     #  #    #   ####     #    ######  #    #  #    #  #  #    #  #####"                                                                          
  end

  def display_player_choice
    puts "\n==> Welcome to Mastermind!"
    puts "==> Would you like to be the codebreaker or codemaker?"
    print "==> Type in 'breaker' or 'maker': "
  end

  def display_enter_guess
    "\n==> Please enter your guess in a 1234 format:"
  end

  def display_chicken
    '\n==> Winner. Winner. Chicken Dinner.'
  end

  def display_matches_and_partials(match, partial)
    puts "\n==> Matches: #{match}"
    puts "==> Partials: #{partial}"
  end

  def display_guesses_remaining(guesses)
    return "\n==> You only have 1 guess left." if guesses == 1
    "\n==> You have #{guesses} guesses remaining"
  end

  def display_womp_womp
    "\n==> Womp. Womp. You've lost."
  end

  def display_player_enter_code
    "\n==> Please enter your super secret code in a 1234 format: "
  end

  def display_computer_won(code)
    "\n==> The computer has broken your code. Your secret code is #{code}"
  end

  def display_computer_guessed(guess)
    sleep(1)
    "\n==> The computer has guessed #{guess}"
  end


  def make_array(string)
    string.chars.map(&:to_i)
  end
end

