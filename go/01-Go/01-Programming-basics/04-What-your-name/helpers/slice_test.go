package slice

import (
	"fmt"
	"reflect"
	"testing"
)

func TestFilterStrings(t *testing.T) {
	items := []string{"Louis", "Ramos", "", "Bob"}
	callback := func(item string) bool {
		return item != ""
	}

	filteredItems := Filter(items, callback)
	var want any

	sliceType := fmt.Sprintf("%T", filteredItems)
	want = "[]string"
	if sliceType != want {
		t.Errorf("Expected result to have a type of %v but got a type of %v instead.\n", want, sliceType)
	}

	length := len(filteredItems)
	want = 3
	if length != want {
		t.Errorf("Expected result to have a length of %v but got a length of %v instead\n", want, length)
	}

	want = []string{"Louis", "Ramos", "Bob"}
	if !reflect.DeepEqual(filteredItems, want) {
		t.Errorf("Expected result to be %v but got %v instead.\n", want, filteredItems)
	}
}

func TestFilterInts(t *testing.T) {
	items := []int{1, 2, 3, 4}
	callback := func(item int) bool {
		return item >= 2
	}

	filteredItems := Filter(items, callback)
	var want any

	sliceType := fmt.Sprintf("%T", filteredItems)
	want = "[]int"
	if sliceType != want {
		t.Errorf("Expected result to have a type of %v but got a type of %v instead.\n", want, sliceType)
	}

	length := len(filteredItems)
	want = 3
	if length != want {
		t.Errorf("Expected result to have a length of %v but got a length of %v instead\n", want, length)
	}

	want = []int{2, 3, 4}
	if !reflect.DeepEqual(filteredItems, want) {
		t.Errorf("Expected result to be %v but got %v instead.\n", want, filteredItems)
	}
}

func TestFilterBools(t *testing.T) {
	items := []bool{true, true, false, true}
	callback := func(item bool) bool {
		return item
	}

	filteredItems := Filter(items, callback)
	var want any

	sliceType := fmt.Sprintf("%T", filteredItems)
	want = "[]bool"
	if sliceType != want {
		t.Errorf("Expected result to have a type of %v but got a type of %v instead.\n", want, sliceType)
	}

	length := len(filteredItems)
	want = 3
	if length != want {
		t.Errorf("Expected result to have a length of %v but got a length of %v instead\n", want, length)
	}

	want = []bool{true, true, true}
	if !reflect.DeepEqual(filteredItems, want) {
		t.Errorf("Expected result to be %v but got %v instead.\n", want, filteredItems)
	}
}
