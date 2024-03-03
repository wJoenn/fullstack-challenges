package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"

	"wagonSort/wagon"
)

var reader = bufio.NewReader(os.Stdin)

func main() {
	names := []string{}
	for {
		fmt.Println("Enter a strudent name or press ENTER to finish.")

		name := gets()
		if name == "" {
			break
		}

		names = append(names, name)
	}

	if len(names) > 0 {
		fmt.Printf("Contratulations! Your wagon has %v students\n", len(names))
		if len(names) == 1 {
			fmt.Printf("%v\n", names[0])
		} else {
			sortedNames := wagon.WagonSort(names)
			i := len(sortedNames) - 1
			fmt.Printf("%v and %v\n", strings.Join(sortedNames[:i], ", "), sortedNames[i])
		}
	}
}

func gets() string {
	input, _ := reader.ReadString('\n')
	input = strings.TrimSpace(input)

	return input
}
