package colourful

func isColourful(number int) bool {
	digitsMap := make(map[int]bool)
	var digits []int
	for number > 0 {
		digits = append(digits, number%10)
		number = number / 10
	}

	for i := 1; i <= len(digits); i++ {
		clonedDigits := digits
		for len(clonedDigits) >= i {
			cloneComputation := compute(clonedDigits[:i])
			if digitsMap[cloneComputation] {
				return false
			}

			digitsMap[cloneComputation] = true
			clonedDigits = clonedDigits[1:]
		}
	}

	return true
}

func compute(digits []int) (computation int) {
	for _, digit := range digits {
		if computation == 0 {
			computation += digit
		} else {
			computation *= digit
		}
	}

	return
}
