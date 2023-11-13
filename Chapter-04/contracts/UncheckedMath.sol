// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract UncheckedMath {
    constructor() public {}

    function uncheckedAdd(uint256 a, uint256 b) public pure returns (uint256) {
        unchecked {
            return a + b;
        }
    }

    function uncheckedSub(uint256 a, uint256 b) public pure returns (uint256) {
        unchecked {
            return a - b;
        }
    }

    function uncheckedMul(uint256 a, uint256 b) public pure returns (uint256) {
        unchecked {
            return a * b;
        }
    }

    function uncheckedDiv(uint256 a, uint256 b) public pure returns (uint256) {
        unchecked {
            return a / b;
        }
    }

    function uncheckedMod(uint256 a, uint256 b) public pure returns (uint256) {
        unchecked {
            return a % b;
        }
    }
}
// This contract demonstrates the use of unchecked math operations in Solidity.
// Unchecked math operations do not perform overflow and underflow checks, which
// can result in unexpected behavior if not used carefully.

// In this contract, we define five functions that perform addition, subtraction,
// multiplication, division, and modulus operations without performing any
// overflow and underflow checks. The 'unchecked' keyword is used to disable
// these checks.

// It is important to note that while unchecked math operations can be useful
// for certain use cases, they should be used with caution and only in cases
// where the inputs are guaranteed to be within a safe range to prevent potential
// security vulnerabilities.