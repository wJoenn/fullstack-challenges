package age

import (
	"time"

	"github.com/rickb777/date"
)

func AgeInDays(day, month, year int) date.PeriodOfDays {
	birthDate := date.New(year, time.Month(month), day).DaysSinceEpoch()
	today := date.Today().DaysSinceEpoch()

	return today - birthDate
}
