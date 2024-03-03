require_relative "croupier"

# TODO: make the user play from terminal in a while loop that will stop
#       when the user will not be asking for  a new card

bet = 0
money = 10

bank = pick_bank_score
player = 0

def play(player, bank)
  input = ""
  until input == "tap"
    if input == ""

      player += pick_player_card
      break if player >= 21

      p state_of_the_game(player, bank)
      p "Press enter to draw a card or type 'tap' to fold."
    else
      p "That's not a correct input, try again"
    end
    input = gets.chomp.to_s
  end
  player
end

until bet == "quit"
  p "Your money is #{money}, enter the amount you want to bet or type 'quit' to stop the game"
  bet = gets.chomp
  break if bet == "quit"

  if (1..money).to_a.include?(bet.to_i)

    player += play(player, bank)

    case end_game_message(player, bank)
    when "You lost"
      money -= bet.to_i * 2
    when "You win", "Black Jack"
      money += bet.to_i * 2
    end

    p end_game_message(player, bank)
    unless money.positive?
      p "You don't have money anymore"
      break
    end

    player = 0
    bank = pick_bank_score
  else
    p "That's not a correct input, try again"
  end
end

if money > 10
  p "Congratulation, you've gained #{money - 10}, see you again."
else
  p "Seems like it wasn't your lucky day, you'll do better next time."
end
