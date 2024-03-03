package name

import (
	"strings"

	slice "whatYourName/helpers"
)

func ComputeName(names ...string) string {
	return strings.Join(slice.Filter(names, func(name string) bool {
		return name != ""
	}), " ")
}
