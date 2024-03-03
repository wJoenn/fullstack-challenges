package wagon_start

import "testing"

func TestWagonStart(t *testing.T) {
	got := wagonStart()
	want := "That's how it starts"

	if got != want {
		t.Errorf("Got %v, but wanted %v\n", got, want)
	}
}
