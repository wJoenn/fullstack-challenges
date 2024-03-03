package circle

import (
	"math"
)

func CircleArea(radius float64) float64 {
	if radius < 0 {
		return 0
	}

	return math.Round(math.Pi * math.Pow(radius, 2))
}
