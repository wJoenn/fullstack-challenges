package colourful

import "testing"

type TestCase struct {
	description string
	input       int
	expected    bool
}

func TestIsColourfulResult(t *testing.T) {
	testCases := []TestCase{
		{
			description: "returns true when the number is 0",
			input:       0,
			expected:    true,
		},
		{
			description: "returns true when the number is 1",
			input:       1,
			expected:    true,
		},
		{
			description: "returns true when the number is 23",
			input:       23,
			expected:    true,
		},
		{
			description: "returns true when the number is 263",
			input:       263,
			expected:    true,
		},
		{
			description: "returns true when the number is 987",
			input:       987,
			expected:    true,
		},
		{
			description: "returns false when the number is 10",
			input:       10,
			expected:    false,
		},
		{
			description: "returns false when the number is 236",
			input:       236,
			expected:    false,
		},
		{
			description: "returns false when the number is 999",
			input:       999,
			expected:    false,
		},
	}

	for _, test := range testCases {
		t.Run(test.description, func(t *testing.T) {
			got := isColourful(test.input)

			if got != test.expected {
				t.Errorf("Expected result to be %v but got %v instead", !got, got)
			}
		})
	}
}
