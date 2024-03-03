require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.

answer = nil
while answer != ""
  puts answer unless answer.nil?
  question = gets.chomp.to_s.strip
  answer = coach_answer_enhanced(question)
end
