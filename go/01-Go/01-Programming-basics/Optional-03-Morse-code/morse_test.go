package morse

import (
	"fmt"
	"testing"
)

func TestDecoder(t *testing.T) {
	testCases := map[string]string{
		"A":                         ".-",
		"HI":                        ".... ..",
		"HI GUYS":                   ".... ..|--. ..- -.-- ...",
		"HEY JUDE DONT MAKE IT BAD": ".... . -.--|.--- ..- -.. .|-.. --- -. -|-- .- -.- .|.. -|-... .- -..",
	}

	for message, morse := range testCases {
		t.Run(fmt.Sprintf("returns %v when the morse code is %v\n", message, morse), func(t *testing.T) {
			got := decoder(morse)

			if got != message {
				t.Errorf("Expected result to be %v but got %v instead.\n", message, got)
			}
		})
	}
}

func TestEncoder(t *testing.T) {
	testCases := map[string]string{
		"a":                           ".-",
		"b":                           "-...",
		"B":                           "-...",
		"hi":                          ".... ..",
		"hi all":                      ".... ..|.- .-.. .-..",
		"hello, world":                ".... . .-.. .-.. ---|.-- --- .-. .-.. -..",
		"Hey Jude, don't make it bad": ".... . -.--|.--- ..- -.. .|-.. --- -. -|-- .- -.- .|.. -|-... .- -..",
	}

	for message, morse := range testCases {
		t.Run(fmt.Sprintf("returns %v when the message is %v\n", morse, message), func(t *testing.T) {
			got := encoder(message)

			if got != morse {
				t.Errorf("Expected result to be %v but got %v instead.\n", morse, got)
			}
		})
	}
}
