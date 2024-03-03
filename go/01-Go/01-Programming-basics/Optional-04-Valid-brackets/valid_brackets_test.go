package brackets

import (
	"fmt"
	"testing"
)

func TestIsValidBracketsSimple(t *testing.T) {
	testCases := map[string]bool{
		"":                  true,
		"()()(()":           false,
		"(())()":            true,
		"((hello))() world": true,
	}

	for input, result := range testCases {
		t.Run(fmt.Sprintf("result should be %v with input %v\n", result, input), func(t *testing.T) {
			got := isValidBrackets(input)

			if got != result {
				t.Errorf("Expcted result to be %v but got %v instead.\n", result, got)
			}
		})
	}
}

func TestIsValidBracketsEnhanced(t *testing.T) {
	testCases := map[string]bool{
		"()(](){)":              false,
		"{}[()]":                true,
		"{hello}([world]) ({})": true,
		"[(])":                  false,
	}

	for input, result := range testCases {
		t.Run(fmt.Sprintf("result should be %v with input %v\n", result, input), func(t *testing.T) {
			got := isValidBrackets(input)

			if got != result {
				t.Errorf("Expcted result to be %v but got %v instead.\n", result, got)
			}
		})
	}
}
