package buddy

import (
	"reflect"
	"testing"
)

func TestTodayMyBuddysGithubNicknameIsTakesNoParameter(t *testing.T) {
	got := reflect.ValueOf(todayMyBuddysGithubNicknameIs).Type().NumIn()

	if got != 0 {
		t.Errorf("Got %v, but wanted 0", got)
	}
}

func TestTodayMyBuddysGithubNicknameIsNotBlank(t *testing.T) {
	got := todayMyBuddysGithubNicknameIs()

	if got == "" {
		t.Errorf("Got an empty string, but wanted github name")
	}
}
