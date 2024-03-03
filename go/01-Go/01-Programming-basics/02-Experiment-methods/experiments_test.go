package experiments

import (
	"reflect"
	"slices"
	"sort"
	"testing"
)

func TestGetRidOfSurroundingWhitespaces(t *testing.T) {
	got := getRidOfSurroundingWhitespaces("   Hello there   ")
	want := "Hello there"

	if got != want {
		t.Errorf("Got %v, but wanted %v", got, want)
	}
}

func TestBelongsTo(t *testing.T) {
	got := belongsTo("Hello there", "llo")

	if !got {
		t.Error("Got false, but wanted true")
	}

	got = belongsTo("Hello there", "hi")

	if got {
		t.Error("Got true, but wanted false")
	}
}

func TestReplace(t *testing.T) {
	got := replace("Hello there", "l", "w")
	want := "Hewwo there"

	if got != want {
		t.Errorf("Got %v, but wanted %v", got, want)
	}
}

func TestExactlyDivide(t *testing.T) {
	got := exactlyDivide(13, 4)
	want := 3.25

	if got != want {
		t.Errorf("Got %v, but wanted %v", got, want)
	}

	got = exactlyDivide(12, 4)
	want = 3

	if got != want {
		t.Errorf("Got %v, but wanted %v", got, want)
	}
}

func TestDivisibleByTwo(t *testing.T) {
	got := divisibleByTwo(10)

	if !got {
		t.Error("Got false, but wanted true")
	}

	got = divisibleByTwo(9)

	if got {
		t.Error("Got true, but wanted false")
	}
}

func TestRandomSubset(t *testing.T) {
	list := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}
	size := 4

	got := randomSubset(list, size)
	notWant := randomSubset(list, size)

	if len(got) != size {
		t.Errorf("Got %v, but wanted %v", len(got), size)
	}

	if reflect.DeepEqual(got, notWant) {
		t.Errorf("%v and %v are the same, but wanted them different", got, notWant)
	}

	if !reflect.DeepEqual(list, []int{1, 2, 3, 4, 5, 6, 7, 8, 9}) {
		t.Errorf("list should not be modified, but is now %v", list)
	}

	for _, item := range got {
		if !slices.Contains(list, item) {
			t.Errorf("Expected all items of %v to be contained in %v", got, list)
		}
	}
}

func TestRandomize(t *testing.T) {
	list := []int{1, 2, 3, 4, 5, 6, 7, 8, 9}

	got := randomize(list)
	notWant := randomize(list)

	if reflect.DeepEqual(got, notWant) {
		t.Errorf("Expected %v and %v to be different", got, notWant)
	}

	sort.Ints(got)
	if !reflect.DeepEqual(got, list) {
		t.Errorf("Expected %v and %v to be equal", got, list)
	}

	if !reflect.DeepEqual(list, []int{1, 2, 3, 4, 5, 6, 7, 8, 9}) {
		t.Error("Expected list to not be modified")
	}
}

func TestAscendingOrder(t *testing.T) {
	list := []string{"z", "y", "x", "w", "v"}

	got := ascendingOrder(list)
	want := []string{"v", "w", "x", "y", "z"}

	if !reflect.DeepEqual(got, want) {
		t.Errorf("Expected %v and %v to be equal", got, want)
	}

	if !reflect.DeepEqual(list, []string{"z", "y", "x", "w", "v"}) {
		t.Error("Expected list to not be modified")
	}
}
