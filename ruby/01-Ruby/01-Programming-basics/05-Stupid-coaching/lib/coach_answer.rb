# This is a comment to remind you not to push too early dumbass

# TODO: return coach answer to your_message
def coach_answer(your_message)
  if your_message.capitalize == "I am going to work right now!"
    ""
  elsif your_message[-1] == "?"
    "Silly question, get dressed and go to work!"
  else
    "I don't care, get dressed and go to work!"
  end
end

# TODO: return coach answer to your_message, with additional custom rules of yours!
def coach_answer_enhanced(your_message)
  enhancement = "I can feel your motivation! " if your_message == your_message.upcase
  if your_message.capitalize == "I am going to work right now!"
    ""
  elsif your_message[-1] == "?"
    "#{enhancement}Silly question, get dressed and go to work!"
  else
    "#{enhancement}I don't care, get dressed and go to work!"
  end
end
