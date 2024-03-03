def coach_answer(your_message : String) : String
  return "" if your_message.downcase == "i am going to work right now!"
  return "Silly question, get dressed and go to work!" if your_message.includes?("?")
  "I don't care, get dressed and go to work!"
end

def coach_answer_enhanced(your_message : String) : String
  initial_answer = coach_answer(your_message)
  return initial_answer if initial_answer == "" || your_message != your_message.upcase

  "I can feel your motivation! #{initial_answer}"
end
