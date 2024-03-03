package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"coachAnswer/coach"
)

var reader = bufio.NewReader(os.Stdin)

func main() {
	var coachAnswer string

	for {
		input := getInput()
		coachAnswer = coach.CoachAnswer(input)

		if coachAnswer == "" {
			break
		}

		fmt.Println(coachAnswer)
	}
}

func getInput() string {
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	return input
}
