package looping

import (
	"fmt"
	"testing"
)

type TestCase struct {
	min    int
	max    int
	result int
}

func TestSum(t *testing.T) {
	testCases := []TestCase{
		{
			min:    1,
			max:    100,
			result: 5050,
		},
		{
			min:    101,
			max:    100,
			result: -1,
		},
	}

	for _, testCase := range testCases {
		t.Run(fmt.Sprintf("%v..%v=%v\n", testCase.min, testCase.max, testCase.result), func(t *testing.T) {
			got := sum(testCase.min, testCase.max)

			if got != testCase.result {
				t.Errorf("expectec: %v\ngot: %v\n", testCase.result, got)
			}
		})
	}
}
