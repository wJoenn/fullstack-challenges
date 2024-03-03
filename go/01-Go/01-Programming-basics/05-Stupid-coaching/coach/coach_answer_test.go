package coach

import (
	"fmt"
	"testing"
)

func TestCoachAnswerType(t *testing.T) {
	got := fmt.Sprintf("%T", CoachAnswer("Hello coach"))
	expect := "string"

	if got != expect {
		t.Errorf("Expected response to be of type %v but got %v instead.\n", expect, got)
	}
}

func TestCoachAnswerStatementResponse(t *testing.T) {
	got := CoachAnswer("I would love to eat some pizza!")
	expect := "I don't care, get dressed and go to work!"

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerQuestionResponse(t *testing.T) {
	got := CoachAnswer("Can I eat some pizza?")
	expect := "Silly question, get dressed and go to work!"

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerWorkResponse(t *testing.T) {
	got := CoachAnswer("I am going to work right now!")
	expect := ""

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedType(t *testing.T) {
	got := fmt.Sprintf("%T", CoachAnswerEnhanced("Hello coach"))
	expect := "string"

	if got != expect {
		t.Errorf("Expected response to be of type %v but got %v instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedStatementResponse(t *testing.T) {
	got := CoachAnswerEnhanced("I would love to eat some pizza!")
	expect := "I don't care, get dressed and go to work!"

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedQuestionResponse(t *testing.T) {
	got := CoachAnswerEnhanced("Can I eat some pizza?")
	expect := "Silly question, get dressed and go to work!"

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedWorkResponse(t *testing.T) {
	got := CoachAnswerEnhanced("I am going to work right now!")
	expect := ""

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedUppercaseStatementResponse(t *testing.T) {
	got := CoachAnswerEnhanced("I WOULD LOVE TO EAT SOME PIZZA!")
	expect := "I can feel your motivation! I don't care, get dressed and go to work!"

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedUppercaseQuestionResponse(t *testing.T) {
	got := CoachAnswerEnhanced("CAN I EAT SOME PIZZA?")
	expect := "I can feel your motivation! Silly question, get dressed and go to work!"

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}

func TestCoachAnswerEnhancedUppercaseWorkResponse(t *testing.T) {
	got := CoachAnswerEnhanced("I AM GOING TO WORK RIGHT NOW!")
	expect := ""

	if got != expect {
		t.Errorf("Expected response to be '%v' but got '%v' instead.\n", expect, got)
	}
}
