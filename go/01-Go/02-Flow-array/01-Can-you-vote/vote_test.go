package vote

import (
	"fmt"
	"testing"
)

func TestIsAllowedToVote(t *testing.T) {
	testCases := map[int]bool{
		5:  false,
		10: false,
		17: false,
		18: true,
		20: true,
		25: true,
	}

	for age, allowed := range testCases {
		t.Run(fmt.Sprintf("%v=%v\n", age, allowed), func(t *testing.T) {
			got := isAllowedToVote(age)

			if got != allowed {
				t.Errorf("expected: %v\ngot: %v\n", allowed, got)
			}
		})
	}
}
