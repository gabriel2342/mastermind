# frozen_string_literal: true

module Display
  def display_player_choice
    "Would you like to be the codebreaker or codemaker? Type in 'breaker' or 'maker'"
  end

  def display_enter_guess
    'Please enter your guess in a 1234 format:'
  end

  def display_chicken
    'Winner. Winner. Chicken Dinner.'
  end

  def display_matches_and_partials(match, partial)
    puts "Matches: #{match}"
    puts "Partials: #{partial}"
  end

  def display_guesses_remaining(guesses)
    return "You only have 1 guess left." if guesses == 1
    "You have #{guesses} guesses remaining"
  end

  def display_womp_womp
    "Womp. Womp. You've lost."
  end

  def display_player_enter_code
    'Please enter your super secret code in a 1234 format: '
  end

  def display_computer_won(code)
    "The computer has broken your code. Your secret code is #{code}"
  end

  def display_computer_guessed(guess)
    sleep(1)
    "The computer has guessed #{guess}"
  end

  def make_array(string)
    string.chars.map(&:to_i)
  end
end

