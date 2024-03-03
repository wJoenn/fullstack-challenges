package vote

func isAllowedToVote(age int) bool {
	if age < 18 {
		return false
	}

	return true
}
