package age

import (
	"fmt"
	"testing"

	"github.com/rickb777/date"
)

func TestAgeInDaysType(t *testing.T) {
	got := fmt.Sprintf("%T", AgeInDays(1, 7, 1995))

	if got != "date.PeriodOfDays" {
		t.Errorf("Expected value to be of type date.PeriodOfDays but got %v", got)
	}
}

func TestAgeInDaysValue(t *testing.T) {
	want := date.PeriodOfDays(365 * 28)
	birthDate := date.NewOfDays(date.Today().DaysSinceEpoch() - want)
	got := AgeInDays(birthDate.Day(), int(birthDate.Month()), birthDate.Year())

	if got != want {
		t.Errorf("Expected age in days to be %v but got %v", want, got)
	}
}
