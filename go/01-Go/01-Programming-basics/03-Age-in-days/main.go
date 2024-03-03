package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"

	"ageInDays/age"
)

var reader = bufio.NewReader(os.Stdin)

func main() {
	birthYear := getDatePart("year")
	birthMonth := getDatePart("month")
	birthDay := getDatePart("day")

	fmt.Println("Computing your age (with the most complicated algorithms)......")

	calculatedAge := age.AgeInDays(birthDay, birthMonth, birthYear)

	fmt.Printf("You are %v days old... phew!\n", calculatedAge)
}

func getDatePart(part string) int {
	fmt.Printf("What your %v of birth ? ", part)
	input, _ := reader.ReadString('\n')
	parsedInput, _ := strconv.Atoi(strings.TrimSpace(input))

	return parsedInput
}
