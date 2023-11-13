// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedIfElse {
    constructor() public {}

    function classifyNumber(
        uint256 _number
    ) public pure returns (string memory) {
        if (_number < 0) {
            return "Negative";
        } else if (_number == 0) {
            return "Zero";
        } else if (_number > 0 && _number < 10) {
            return "Single Digit";
        } else if (_number >= 10 && _number < 100) {
            return "Double Digit";
        } else if (_number >= 100 && _number < 1000) {
            return "Triple Digit";
        } else {
            return "Four or More Digits";
        }
    }

    function ternary(uint256 _x) public pure returns (string memory) {
        return _x < 10 ? "Small" : "Big";
    }
}
