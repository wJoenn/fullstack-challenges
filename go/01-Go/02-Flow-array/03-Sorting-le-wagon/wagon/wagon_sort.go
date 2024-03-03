package wagon

import (
	"strings"
)

func WagonSort(input []string) (result []string) {
	for _, name := range input {
		if len(result) == 0 {
			result = append(result, name)
			continue
		}

		for i, sortedName := range result {
			if strings.ToUpper(sortedName) > strings.ToUpper(name) {
				result = append(result[:i+1], result[i:]...)
				result[i] = name
				break
			}

			if i == len(result)-1 {
				result = append(result, name)
			}
		}
	}

	return
}
