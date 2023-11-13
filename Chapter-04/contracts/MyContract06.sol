/** Here's an example of how to declare a variable in storage:
*/

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract MyContract06 {
  uint256 public myNumber;

  function setNumber(uint256 _number) public {
    myNumber = _number;
  }
}
