package ip

import (
	"fmt"
	"strconv"
	"strings"
)

func ipToNumber(ip string) uint32 {
	// return binary.BigEndian.Uint32(net.ParseIP(ip)[12:16])

	bits8String := strings.Split(ip, ".")
	var bits8 [4]uint8

	for i, bit8String := range bits8String {
		value, _ := strconv.ParseUint(bit8String, 10, 8)
		bits8[i] = uint8(value)
	}

	return uint32(bits8[0])<<24 | uint32(bits8[1])<<16 | uint32(bits8[2])<<8 | uint32(bits8[3])
}

func numberToIp(number uint32) string {
	// ip := make(net.IP, 4)
	// binary.BigEndian.PutUint32(ip, number)

	// return fmt.Sprintf("%v", ip)

	bitFFOOOOOO := number >> 24
	bitFFOOOO := number >> 16 & 0xFF
	bitFFOO := number >> 8 & 0xFF
	bitFF := number & 0xFF

	return fmt.Sprintf("%v.%v.%v.%v", bitFFOOOOOO, bitFFOOOO, bitFFOO, bitFF)
}
