package wagon

import (
	"fmt"
	"reflect"
	"testing"
)

type TestCase struct {
	input  []string
	result []string
}

func TestWagonSort(t *testing.T) {
	var nilSlice []string
	testCases := []TestCase{
		{
			input:  nilSlice,
			result: nilSlice,
		},
		{
			input:  []string{"BOB", "ALICE", "CHARLIE"},
			result: []string{"ALICE", "BOB", "CHARLIE"},
		},
		{
			input:  []string{"BOB", "alice", "CHARLIE"},
			result: []string{"alice", "BOB", "CHARLIE"},
		},
	}

	for _, tc := range testCases {
		t.Run(fmt.Sprintf("%v=%v", tc.input, tc.result), func(t *testing.T) {
			got := WagonSort(tc.input)

			if !reflect.DeepEqual(got, tc.result) {
				t.Errorf("expected: %v\ngot: %v\n", tc.result, got)
			}
		})
	}
}
