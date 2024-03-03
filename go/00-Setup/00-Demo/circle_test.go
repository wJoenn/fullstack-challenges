package circle

import (
	"testing"
)

func TestCircleAreaType(t *testing.T) {
	var got interface{} = CircleArea(10)
	_, ok := got.(float64)

	if !ok {
		t.Errorf("Got %T, but wanted int\n", got)
	}
}

func TestCircleAreaPositiveRadius(t *testing.T) {
	got := CircleArea(10)
	var want float64 = 314

	if got != want {
		t.Errorf("Got %f, but wanted %f\n", got, want)
	}
}

func TestCircleAreaNegativeRadius(t *testing.T) {
	got := CircleArea(-10)
	var want float64 = 0

	if got != want {
		t.Errorf("Got %f, but wanted %f\n", got, want)
	}
}
