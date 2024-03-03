package experiments

import (
	"math/rand"
	"sort"
	"strings"
)

func getRidOfSurroundingWhitespaces(aString string) string {
	// TODO: return a copy of the string with leading and trailing whitespaces removed
	return strings.TrimSpace(aString)
}

func belongsTo(aString string, aWord string) bool {
	// TODO: return true if aString contains aWord
	return strings.Contains(aString, aWord)
}

func replace(initialString string, oldLetter string, newLetter string) string {
	// TODO: return a copy of the string with the new letter replacing the old one
	return strings.ReplaceAll(initialString, oldLetter, newLetter)
}

func exactlyDivide(anInteger int, aDivider float64) float64 {
	// TODO: return division of an_integer by a_divider (computing the floating division, NOT the euclidean one)
	return float64(anInteger) / aDivider
}

func divisibleByTwo(anInteger int) bool {
	// TODO: return true if an_integer is divisible by 2
	return anInteger%2 == 0
}

func randomSubset(aSlice []int, sampleSize int) []int {
	// TODO: return a random subset of an_array with size sample_size
	newSlice := make([]int, len(aSlice))
	copy(newSlice, aSlice)

	for i := sampleSize; i > 0; i-- {
		j := rand.Intn(len(newSlice))
		newSlice[i], newSlice[j] = newSlice[j], newSlice[i]
	}

	return newSlice[:sampleSize]
}

func randomize(aSlice []int) []int {
	// TODO: return a randomized copy of an_array
	newSlice := make([]int, len(aSlice))
	copy(newSlice, aSlice)

	rand.Shuffle(len(newSlice), func(i, j int) {
		newSlice[i], newSlice[j] = newSlice[j], newSlice[i]
	})

	return newSlice
}

func ascendingOrder(aSlice []string) []string {
	// TODO: return a copy of an_array with elements in ascending order
	newSlice := make([]string, len(aSlice))
	copy(newSlice, aSlice)

	sort.Strings(newSlice)
	return newSlice
}
