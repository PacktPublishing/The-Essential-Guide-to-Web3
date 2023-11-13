// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AdvancedLoop {
    constructor() public {}

    function printNumbers() public pure returns (uint256[] memory) {
        uint256[] memory numbers = new uint256;
        for (uint256 i = 0; i < numbers.length; i++) {
            numbers[i] = i + 1;
        }
        return numbers;
    }

    function findNumber(
        uint256[] memory _numbers,
        uint256 _target
    ) public pure returns (uint256) {
        uint256 index = 0;
        while (index < _numbers.length) {
            if (_numbers[index] == _target) {
                return index;
            }
            index++;
        }
        return _numbers.length;
    }
}
