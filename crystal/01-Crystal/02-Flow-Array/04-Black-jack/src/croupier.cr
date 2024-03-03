require "./black_jack"

def state_of_the_game(player_score : Int32, bank_score : Int32) : String
  "Your score is #{player_score}, bank is #{bank_score}"
end

def end_game_message(player_score : Int32, bank_score : Int32) : String
  return "Lose" if player_score > 21
  return "Push" if player_score == bank_score
  return "Black Jack" if player_score == 21
  return "Win" if player_score > bank_score
  "Lose"
end
