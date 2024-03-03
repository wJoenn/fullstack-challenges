package morse

import (
	"regexp"
	"strings"
)

var alphabet = map[string]string{
	"A": ".-",
	"B": "-...",
	"C": "-.-.",
	"D": "-..",
	"E": ".",
	"F": "..-.",
	"G": "--.",
	"H": "....",
	"I": "..",
	"J": ".---",
	"K": "-.-",
	"L": ".-..",
	"M": "--",
	"N": "-.",
	"O": "---",
	"P": ".--.",
	"Q": "--.-",
	"R": ".-.",
	"S": "...",
	"T": "-",
	"U": "..-",
	"V": "...-",
	"W": ".--",
	"X": "-..-",
	"Y": "-.--",
	"Z": "--..",
}

func decoder(morse string) string {
	words := strings.Split(morse, "|")

	for i, word := range words {
		chars := strings.Split(word, " ")

		for j, char := range chars {
			for letter, morseChar := range alphabet {
				if morseChar == char {
					chars[j] = letter
					break
				}
			}
		}

		words[i] = strings.Join(chars, "")
	}

	return strings.Join(words, " ")
}

func encoder(message string) string {
	re := regexp.MustCompile(`[^\w ]`)
	message = strings.ToUpper(re.ReplaceAllString(message, ""))
	words := strings.Split(message, " ")

	for i, word := range words {
		chars := strings.Split(word, "")

		for j, char := range chars {
			chars[j] = alphabet[char]
		}

		words[i] = strings.Join(chars, " ")
	}

	return strings.Join(words, "|")
}
