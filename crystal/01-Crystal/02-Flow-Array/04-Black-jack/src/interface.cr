require "./croupier"

player_score = 0
bank_score = pick_bank_score

loop do
  puts "Card? 'y' or 'yes' to get a new card"
  print "> "
  answer = gets.try &.strip

  if answer.nil? || !%w[y yes].includes?(answer)
    puts end_game_message(player_score, bank_score)
    break
  end

  player_score += pick_player_card
  puts state_of_the_game(player_score, bank_score)
  if player_score >= 21
    puts end_game_message(player_score, bank_score)
    break
  end
end
