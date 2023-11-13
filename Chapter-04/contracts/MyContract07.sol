/**
Here's an example of how to declare a variable in memory:
 */
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyContract07 {

    function calculateSum(uint256[] memory _numbers) public pure returns (uint256) {
    uint256 sum = 0;
    for (uint256 i = 0; i < _numbers.length; i++) {
      sum += _numbers[i];
    }
    return sum;
  }

}
