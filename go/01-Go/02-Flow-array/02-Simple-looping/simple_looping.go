package looping

func sum(x, y int) (r int) {
	if x > y {
		return -1
	}

	for i := x; i <= y; i++ {
		r += i
	}

	return
}
