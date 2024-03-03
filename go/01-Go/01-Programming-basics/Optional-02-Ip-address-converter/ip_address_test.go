package ip

import (
	"fmt"
	"testing"
)

var testCases = map[string]int{
	"37.160.113.170": 631271850,
	"192.168.0.1":    3232235521,
}

func TestIpToNum(t *testing.T) {
	for ip, number := range testCases {
		t.Run(fmt.Sprintf("return %v when the ip address is %v", number, ip), func(t *testing.T) {
			got := ipToNumber(ip)

			if got != uint32(number) {
				t.Errorf("Expected result to be %v but got %v instead.", number, got)
			}
		})
	}
}

func TestNumToIp(t *testing.T) {
	for ip, number := range testCases {
		t.Run(fmt.Sprintf("return %v when the number is %v", ip, number), func(t *testing.T) {
			got := numberToIp(uint32(number))

			if got != ip {
				t.Errorf("Expected result to be %v but got %v instead.", ip, got)
			}
		})
	}
}
