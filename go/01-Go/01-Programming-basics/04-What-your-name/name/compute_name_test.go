package name

import (
	"fmt"
	"testing"
)

var computedName = ComputeName("Louis", "Ramos")

func TestComputeNameType(t *testing.T) {
	got := fmt.Sprintf("%T", computedName)
	want := "string"

	if got != want {
		t.Errorf("Expected result to be a %v but got a %v instead.\n", want, got)
	}
}

func TestComputeNameValue(t *testing.T) {
	want := "Louis Ramos"

	if computedName != want {
		t.Errorf("Expected result to be %v but got %v instead\n", want, computedName)
	}
}
