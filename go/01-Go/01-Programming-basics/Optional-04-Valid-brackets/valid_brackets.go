package brackets

import (
	"strings"
)

type Bracket map[string]string

var brackets = Bracket{
	"(": ")",
	"[": "]",
	"{": "}",
}

func isValidBrackets(input string) bool {
	stack := make([]string, 0)

	for _, char := range strings.Split(input, "") {
		if brackets[char] != "" {
			stack = append(stack, char)
			continue
		}

		bracket := brackets.key(char)
		if bracket != "" {
			l := len(stack)
			if l == 0 || bracket != stack[l-1] {
				return false
			}

			stack = stack[:l-1]
		}
	}

	return len(stack) == 0
}

func (m Bracket) key(v string) string {
	for key, value := range m {
		if value == v {
			return key
		}
	}

	return ""
}
