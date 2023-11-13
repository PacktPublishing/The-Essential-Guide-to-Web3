// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract BitwiseOperatorsExample {
    uint8 public a = 60; // 0011 1100
    uint8 public b = 13; // 0000 1101
    uint8 public c;

    function bitwiseAnd() public view returns (uint8) {
        c = a & b; // 0000 1100
        return c;
    }

    function bitwiseOr() public view returns (uint8) {
        c = a | b; // 0011 1101
        return c;
    }

    function bitwiseXor() public view returns (uint8) {
        c = a ^ b; // 0011 0001
        return c;
    }

    function bitwiseNot() public view returns (uint8) {
        c = ~a; // 1100 0011
        return c;
    }

    function leftShift() public view returns (uint8) {
        c = a << 2; // 1111 0000
        return c;
    }

    function rightShift() public view returns (uint8) {
        c = a >> 2; // 0000 1111
        return c;
    }
}


// This contract demonstrates the use of bitwise operators in Solidity.

// Bitwise AND (&) returns a value where each bit is set to 1 only if both corresponding
// bits are 1.

// Bitwise OR (|) returns a value where each bit is set to 1 if either corresponding bit is 1.

// Bitwise XOR (^) returns a value where each bit is set to 1 only if the corresponding 
// bits are different.

// Bitwise NOT (~) returns a value where each bit is flipped (0 becomes 1, and 1 becomes 0).

// Left shift (<<) shifts the bits to the left by the specified number of places, filling the
// right side with zeros.

// Right shift (>>) shifts the bits to the right by the specified number of places,
// filling the left side with zeros for unsigned numbers, and copying the leftmost bit 
// for signed numbers.