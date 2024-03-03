require_relative 'black_jack'

def state_of_the_game(player_score, bank_score)
  # TODO: return (not print!) a message containing the player's score and bank's score
  "Player's score is #{player_score} and bank's is #{bank_score}"
end

def end_game_message(player_score, bank_score)
  # TODO: return (not print!) a message telling if the user won or lost.
  case player_score
  when 22..100, 0...bank_score then "You lost"
  when bank_score then "It's a push"
  when bank_score...21 then "You win"
  when 21 then "Black Jack"
  end
end
