package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"whatYourName/name"
)

var reader = bufio.NewReader(os.Stdin)

func main() {
	firstName := askField("firstName", true)
	middleName := askField("middle name", false)
	lastName := askField("last name", true)

	fmt.Println("Hello there")
	fmt.Printf("General %v\n", name.ComputeName(firstName, middleName, lastName))
}

func askField(field string, required bool) string {
	fmt.Printf("What's your %v ?\n", field)

	if required {
		return askRequiredField()
	}

	return getInput()
}

func askRequiredField() string {
	input := getInput()

	if input == "" {
		fmt.Println("This is a required field, try again please.")
		askRequiredField()
	}

	return input
}

func getInput() string {
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	return input
}
