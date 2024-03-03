package slice

func Filter[T any](items []T, callback func(T) bool) (filtereditems []T) {
	for _, item := range items {
		if callback(item) {
			filtereditems = append(filtereditems, item)
		}
	}

	return
}
