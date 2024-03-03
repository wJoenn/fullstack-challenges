package coach

import (
	"fmt"
	"strings"
)

func CoachAnswer(yourMessage string) string {
	if complete(yourMessage) {
		return ""
	}

	if yourMessage[len(yourMessage)-1:] == "?" {
		return "Silly question, get dressed and go to work!"
	}

	return "I don't care, get dressed and go to work!"
}

func CoachAnswerEnhanced(yourMessage string) string {
	if yourMessage == strings.ToUpper(yourMessage) && !complete(yourMessage) {
		return fmt.Sprintf("I can feel your motivation! %v", CoachAnswer(yourMessage))
	}

	return CoachAnswer(yourMessage)
}

func complete(s string) bool {
	return strings.ToLower(s) == "i am going to work right now!"
}
