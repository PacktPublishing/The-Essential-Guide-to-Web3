/*
Here are some examples of using integer data types in Solidity:

*/

// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
contract MyContract03 {
  int8 public myInt8 = -128;
  uint256 public myUint256 = 123456789;
  int128 public myInt128 = -123456789;
  
  function addInts(int16 a, int16 b) public pure returns (int16) {
    return a + b;
  }
  
  function divideInts(uint8 a, uint8 b) public pure returns (uint8) {
    require(b != 0, "Cannot divide by zero");
    return a / b;
  }
}